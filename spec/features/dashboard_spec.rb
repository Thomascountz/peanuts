require 'rails_helper'

RSpec.feature "event", :type => :feature do

  context 'When a user is not signed in' do
    scenario 'they try to visit their dashboard' do
      visit '/dashboard'
      expect(current_path).to eq('/users/sign_in')
      expect('.alert').to be_present
    end
  end

  context 'When a user is signed in' do
    scenario 'they create a new event' do
      user = create(:user)
      login_as(user)

      # Create event, first with invalid inputs
      visit '/dashboard'
      expect(page).to have_link('', href: '/events/new', count: 2)
      page.click_link('sell tickets')
      expect(current_path).to eq('/events/new')
      event = build_stubbed(:event, title: "",
                                    description: "this is too short.",
                                    location: "")
      page.fill_in('Title', with: event.title)
      page.fill_in('Description', with: event.description)
      page.fill_in('Location', with: event.location)
      page.click_button('Submit')
      expect(current_path).to_not eq('/dashboard')
      expect(page).to have_css('div#error_explaination')

      # Then with valid inputs
      event = build_stubbed(:event)
      page.fill_in('Title', with: event.title)
      page.fill_in('Description', with: event.description)
      page.fill_in('Location', with: event.location)
      page.click_button('Submit')
      expect(current_path).to eq('/dashboard')
      expect(page).to have_css('div.alert')
      expect(body).to have_content(event.title)
    end

    scenario 'they edit an event' do
      event = create(:event)
      login_as(event.manager)
      invalid_title = "a" * 51
      new_title = 'New Title'

      # First with invalid input
      visit '/dashboard'
      page.click_link('edit', :match => :first)
      page.fill_in('Title', with: invalid_title)
      page.click_button('Submit')
      expect(current_path).to_not eq('/dashboard')
      expect(page).to have_css('div#error_explaination')

      # Then with valid input
      page.fill_in('Title', with: new_title)
      page.click_button('Submit')
      expect(current_path).to eq('/dashboard')
      expect(page).to have_css('div.alert')
      expect(body).to have_content(new_title)
    end

    scenario 'they delete an event' do
      event = create(:event)
      login_as(event.manager)
      visit '/dashboard'
      page.click_link('edit', :match => :first)
      expect(page).to have_button('Cancel my event')
      page.click_button('Cancel my event')
      expect(current_path).to eq('/dashboard')
      expect(page).to have_css('div.alert')
      expect(body).to_not have_content(event.title)
    end

    scenario 'they visit event page' do
      event = create(:event)
      event_time = create(:event_time, start_time: Time.zone.now + 1.hour, event: event)

      # must skip validations in order to save an EventTime record which has a start_time in the past
      past_event_time = build(:event_time, start_time: Time.zone.now - 1.hour, event: event)
      past_event_time.save(:validate => false)

      login_as(event.manager)
      visit '/dashboard'
      page.click_link('tickets')
      expect(page).to have_content(event.title)
      expect(page).to have_content('upcoming')
      expect(page).to have_content('past')
    end

    scenario 'they add an event time to an event' do
      event_time = build_stubbed(:event_time, event: nil)
      event = create(:event)
      login_as(event.manager)
      visit '/dashboard'
      page.click_link('tickets')
      expect(page).to have_content('You currently have no show times.')

      # Create event time, with valid inputs
      page.click_link('add tickets')
      expect(page).to have_content(event.title)
      select_date_and_time(event_time.start_time, from: :event_time_start_time)
      select_date_and_time(event_time.end_time, from: :event_time_end_time)
      page.click_button('Submit')
      expect(current_path).to eq(event_path(event))
      expect(page).to have_content('upcoming show times')
      expect(page).to have_content(event_time.start_time.strftime('%A %b %e @ %l:%M %p'))
      expect(page).to have_content(event_time.end_time.strftime('%A %b %e @ %l:%M %p'))

      # Edit event time, with valid inputs
      new_start_time = (Time.zone.now + 12.hours).beginning_of_hour
      new_end_time = (Time.zone.now + 16.hours).beginning_of_hour
      page.click_link('edit', :match => :first)
      select_date_and_time(new_start_time, from: :event_time_start_time)
      select_date_and_time(new_end_time, from: :event_time_end_time)
      page.click_button('Submit')
      expect(current_path).to eq(event_path(event))
      expect(page).to have_content(new_start_time.strftime('%A %b %e @ %l:%M %p'))
      expect(page).to have_content(new_end_time.strftime('%A %b %e @ %l:%M %p'))
    end
  end

  private

    # fills in appropirate datetime select boxes with given datetime object
    def select_date_and_time(date, options = {})
      field = options[:from]
      select date.strftime('%Y'),    :from => "#{field}_1i" #year
      select date.strftime('%B'),    :from => "#{field}_2i" #month
      select date.strftime('%d'),    :from => "#{field}_3i" #day
      select date.strftime('%I %p'), :from => "#{field}_4i" #hour
      select date.strftime('%M'),    :from => "#{field}_5i" #minute
    end
end
