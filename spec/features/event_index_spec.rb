require 'rails_helper'

RSpec.feature "event index page", :type => :feature do 

	let(:event1) { create(:event) }

	context 'when vising the site' do

		before { event1 }

	 	scenario 'user visits the event index page' do
	 		visit events_path
	 		expect(page).to have_content(event1.title)
	 		expect(page).to have_content(event1.description)
	 		expect(page).to have_content(event1.location)
	 		expect(page).to have_link('more info', href: event_path(event1))
	 	end
	end

end