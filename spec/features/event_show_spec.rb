require 'rails_helper'

RSpec.feature "event", :type => :feature do  

  let(:event_time) { create(:event_time) }

  context 'when logged in as the event manager' do    

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
      expect(page).to have_content(event_time.start_time.strftime('%A %b %e @ %l:%M %p'))
      expect(page).to have_content(event_time.end_time.strftime('%A %b %e @ %l:%M %p'))
      expect(page).to have_content('past')
      expect(page).to have_content(past_event_time.start_time.strftime('%A %b %e @ %l:%M %p'))
      expect(page).to have_content(past_event_time.end_time.strftime('%A %b %e @ %l:%M %p'))
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
      expect(page).to have_css('div.alert')
      expect(page).to have_content(new_start_time.strftime('%A %b %e @ %l:%M %p'))
      expect(page).to have_content(new_end_time.strftime('%A %b %e @ %l:%M %p'))

      # Deletes event time
      page.click_link('edit', :match => :first)
      expect(page).to have_button('Cancel this showtime')
      page.click_button('Cancel this showtime')
      expect(current_path).to eq(event_path(event))
      expect(page).to have_css('div.alert')
      expect(page).to_not have_content(new_start_time.strftime('%A %b %e @ %l:%M %p'))
      expect(page).to_not have_content(new_end_time.strftime('%A %b %e @ %l:%M %p'))
    end
  end



  context 'when logged in as patron' do

    let(:patron) { create(:user) }
    before { login_as(patron) }

    scenario 'user visits the event page' do
      visit event_path(event_time.event)
      expect(page).to have_content(event_time.start_time.strftime('%A %b %e @ %l:%M %p'))
      expect(page).to have_content(event_time.end_time.strftime('%A %b %e @ %l:%M %p'))
      expect(page).to have_link("buy ticket")
    end

  end

end