require 'rails_helper'

RSpec.feature "event index page", :type => :feature do 

	let(:event1) { create(:event, title: "Awesometown") }
	let(:event2) { create(:event, title: "My First Play") }
	let(:event3) { create(:event, title: "Hamilton") }

	context 'when vising the site' do
	 	scenario 'user visits the event index page' do
	 		visit events_path
	 		expect(page).to have_content(event1.title)
	 		expect(page).to have_content(event2.title)
	 		expect(page).to have_content(event3.title)
	 	end
	end

end