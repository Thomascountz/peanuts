require 'rails_helper'

RSpec.feature "homepage", :type => :feature do

  before(:each) { visit "/" }

  context 'non-signed-in user' do
  
    scenario 'User visits the hompage' do
      expect(page).to have_link('log in', href: '#')
      expect(page).to have_link('sell tickets', href: '#')
      expect(page).to have_link('buy tickets', href: '#')
    end
    
  end
end