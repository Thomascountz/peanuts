require 'rails_helper'

RSpec.feature "AboutPages", type: :feature do
  scenario 'User visits the about page' do
      visit '/about'
      expect(page).to have_text('Who We Are')
      expect(page).to have_text('What We Want')
    end
end
