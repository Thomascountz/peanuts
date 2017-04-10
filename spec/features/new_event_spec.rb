require 'rails_helper'

RSpec.feature "event", :type => :feature do

  context 'non-signed-in user' do
    scenario 'User visits the new event form page' do
      visit '/events/new'
      expect(current_path).to eq('/users/sign_in')
      expect('.alert').to be_present
    end
  end

  context 'when user is signed in' do
    scenario 'User create a new event with valid inputs' do
      user = create(:user)
      event = build_stubbed(:event)
      login_as(user)
      visit '/events/new'
      page.fill_in('Title', with: event.title)
      page.fill_in('Description', with: event.description)
      page.fill_in('Location', with: event.location)
      page.click_button('Create event')
      expect(current_path).to eq('/dashboard')
      expect('.alert').to be_present
    end

    scenario 'User create a new event with invalid inputs' do
      user = create(:user)
      event = build_stubbed(:event, title: "",
                                    description: "this is too short.",
                                    location: "")
      login_as(user)
      visit '/events/new'
      page.fill_in('Title', with: event.title)
      page.fill_in('Description', with: event.description)
      page.fill_in('Location', with: event.location)
      page.click_button('Create event')
      expect(current_path).to_not eq('/dashboard')
      expect('.error_explainations'). to be_present
    end
  end
end
