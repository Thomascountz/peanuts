require 'rails_helper'

describe 'homepage', type: :feature do
  
  before(:each) { visit root_path }
  
  context 'when User is not signed in' do
    
    scenario 'User sees link to login' do
      expect(page).to have_link('log in', href: '#')
    end
    
    scenario 'User sees a link to sell tickets' do
      expect(page).to have_link('sell tickets', href: '#')
    end
    
    scenario 'User sees a link to buy tickets' do
      expect(page).to have_link('buy tickets', href: '#')
    end
    
  end
end