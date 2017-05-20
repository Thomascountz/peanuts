require 'rails_helper'

RSpec.feature "homepage", :type => :feature do

  before(:each) { visit "/" }

  context 'non-signed-in user' do

    scenario 'User visits the hompage' do
      expect(page).to have_link('Log in', href: new_user_session_path)
      expect(page).to have_link('sell tickets', href: new_event_path)
      expect(page).to have_link('buy tickets', href: events_path)
    end

    scenario 'Signs in as Demo Dan' do
      create(:user, first_name: 'Dan', email: 'demodan@example.com')
      expect(page).to have_link('Sign in as Demo Dan', href: demo_path)
      page.click_link('Sign in as Demo Dan')
      visit '/dashboard'
      expect(page).to have_content('Hello Dan!')
    end

  end
end
