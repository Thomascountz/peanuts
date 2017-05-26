require 'rails_helper'

RSpec.feature "dashboard", :type => :feature do

  let(:user) { create(:user) }
  let(:event_time) { create(:event_time) }
  let(:event) { event_time.event }
  let(:patron) { create(:attendee) }
  let(:ticket) { create(:ticket, attendee: patron, event_time: event_time) }

  context 'When a user is not signed in' do
    scenario 'user visit their dashboard' do
      visit '/dashboard'
      expect(current_path).to eq('/users/sign_in')
      expect('.alert').to be_present
    end
  end

  context 'When a user is signed in' do
    before do
      login_as(user) 
      visit '/dashboard'
    end

    scenario 'user creates a new event' do
      # Create event, first with invalid inputs
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
  end

  context 'When an event manager is signed in' do
    before do
      event
      login_as(event.manager)
      visit '/dashboard'
    end 

    scenario 'they edit an event' do
      invalid_title = "a" * 51
      new_title = 'New Title'

      # First with invalid input
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
      page.click_link('edit', :match => :first)
      expect(page).to have_button('Cancel my event')
      page.click_button('Cancel my event')
      expect(current_path).to eq('/dashboard')
      expect(page).to have_css('div.alert')
      expect(body).to_not have_content(event.title)
    end
  end

  context 'When a patron is signed in' do
    # login as patron
    before do
      ticket
      event
      patron
      login_as(patron) 
      visit '/dashboard'
    end

    scenario 'user sees the details of their purchased tickets' do
      expect(page).to have_content(event.title)
      expect(page).to have_content(datetime_formatter(event_time.start_time))
      expect(page).to have_content(event.location)
      expect(page).to have_link('view event', href: event_path(ticket.event_time.event))
    end
  end

  context 'when a non-event manager is signed in' do
    before do
      event
      user
      login_as(user)
    end
    scenario "user tries to edit another user's event" do
      visit edit_event_path(event)
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_css('div.alert')
    end
  end
end
