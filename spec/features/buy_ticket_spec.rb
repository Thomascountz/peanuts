require 'rails_helper'

RSpec.feature "buy ticket", :type => :feature do

  context 'When a user is signeded in' do
    scenario 'they find and buy a ticket' do
      user = create(:user)
      ticket = create(:ticket)
      event = ticket.event_time.event
      login_as(user)
      visit '/'
      page.click_link('buy tickets', :match => :first)
      expect(current_path).to eq('/events')
      expect(page).to have_content(event.title)
      page.click_link('tickets', :match => :first)
      expect(current_path).to eq(event_path(event))
      expect(page).to have_content(event.title)
      page.click_link('buy', :match => :first)
      expect(current_path).to eq('/dashboard')
      expect(page).to have_content(event.title)
    end
  end
end
