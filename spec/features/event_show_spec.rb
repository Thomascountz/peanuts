require 'rails_helper'

RSpec.feature "event show page", :type => :feature do  

  let(:event) { create(:event) }
  let(:event_time) { create(:event_time, event: event) }
  let(:past_event_time) do
    # must skip validations in order to save an EventTime record which has a start_time in the past
    past_event_time = build(:event_time, start_time: Time.zone.now - 1.hour, event: event)
    past_event_time.save(:validate => false)
    past_event_time
  end
  let(:patron) { create(:user) }

  context 'when logged in as the event manager' do    

    before do
      event
      event_time
      past_event_time
      login_as(event.manager) 
      visit event_path(event)
    end

    scenario 'user visits event page' do
      expect(page).to have_content(event.title)
      expect(page).to have_content('upcoming')
      expect(page).to have_content(event_time.start_time.strftime('%A %b %e @ %l:%M %p'))
      expect(page).to have_content(event_time.end_time.strftime('%A %b %e @ %l:%M %p'))
      expect(page).to have_content('past')
      expect(page).to have_content(past_event_time.start_time.strftime('%A %b %e @ %l:%M %p'))
      expect(page).to have_content(past_event_time.end_time.strftime('%A %b %e @ %l:%M %p'))
      expect(page).to have_link('edit')
    end

    scenario 'user adds an event time to an event' do
      new_event_time = build_stubbed(:event_time, 
                                      start_time: (Time.zone.now + 2.hours).beginning_of_hour,
                                      end_time: (Time.zone.now + 3.hours).beginning_of_hour,
                                      event: nil)
      page.click_link('add tickets')
      expect(page).to have_content(event.title)
      select_date_and_time(new_event_time.start_time, from: :event_time_start_time)
      select_date_and_time(new_event_time.end_time, from: :event_time_end_time)
      page.click_button('Submit')
      expect(current_path).to eq(event_path(event))
      expect(page).to have_content('upcoming show times')
      expect(page).to have_content(new_event_time.start_time.strftime('%A %b %e @ %l:%M %p'))
      expect(page).to have_content(new_event_time.end_time.strftime('%A %b %e @ %l:%M %p'))
    end

    scenario "user edits an existing event's event time" do
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
    end

    scenario "user deletes an existing event's event time" do
      page.click_link('edit', :match => :first)
      expect(page).to have_button('Cancel this showtime')
      page.click_button('Cancel this showtime')
      expect(current_path).to eq(event_path(event))
      expect(page).to have_css('div.alert')
      expect(page).to_not have_content(event_time.start_time.strftime('%A %b %e @ %l:%M %p'))
    end
  end



  context 'when logged in as patron' do

    before { login_as(patron) }

    scenario 'user visits the event page' do
      visit event_path(event_time.event)
      expect(page).to have_content(event_time.start_time.strftime('%A %b %e @ %l:%M %p'))
      expect(page).to have_content(event_time.end_time.strftime('%A %b %e @ %l:%M %p'))
      expect(page).to have_link("buy ticket")
    end

  end

end