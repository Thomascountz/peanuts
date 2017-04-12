require 'rails_helper'

RSpec.feature "event", :type => :feature do

  context 'When a user is not signed in' do
    scenario 'They try to visit their dashboard' do
      visit '/dashboard'
      expect(current_path).to eq('/users/sign_in')
      expect('.alert').to be_present
    end
  end

  context 'when user is signed in' do
    scenario 'User creates a new event with valid inputs' do
      user = create(:user)
      event = build_stubbed(:event)
      login_as(user)

      # Create event
      visit '/dashboard'
      expect(page).to have_link('', href: '/events/new', count: 2)
      page.click_link('sell tickets')
      expect(current_path).to eq('/events/new')
      page.fill_in('Title', with: event.title)
      page.fill_in('Description', with: event.description)
      page.fill_in('Location', with: event.location)
      page.click_button('Submit')
      expect(current_path).to eq('/dashboard')
      expect(page).to have_css('div.alert')
      expect(body).to have_content(event.title)

      # Edit event
      new_title = 'New Title'
      page.click_link('edit', :match => :first)
      page.fill_in('Title', with: new_title)
      page.click_button('Submit')
      expect(current_path).to eq('/dashboard')
      expect(page).to have_css('div.alert')
      expect(body).to have_content(new_title)
    end

    scenario 'User creates a new event with invalid inputs' do
      user = create(:user)
      event = build_stubbed(:event, title: "",
                                    description: "this is too short.",
                                    location: "")
      login_as(user)
      visit '/events/new'
      page.fill_in('Title', with: event.title)
      page.fill_in('Description', with: event.description)
      page.fill_in('Location', with: event.location)
      page.click_button('Submit')
      expect(current_path).to_not eq('/dashboard')
      expect(page).to have_css('div#error_explaination')
    end
  end
end
