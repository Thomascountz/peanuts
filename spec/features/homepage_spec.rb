require 'rails_helper'

RSpec.feature "homepage", :type => :feature do

  before(:each) { visit "/" }

  context 'non-signed-in user' do
  
    scenario 'User visits the hompage' do
      expect(page).to have_link('Log in', href: new_user_session_path)
      expect(page).to have_link('sell tickets', href: '#')
      expect(page).to have_link('buy tickets', href: '#')
    end
    
  end
end