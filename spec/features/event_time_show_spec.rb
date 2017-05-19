require 'rails_helper'

RSpec.feature "event time show page", :type => :feature do  

	let(:event) { create(:event) }
  let(:event_time) { create(:event_time, event: event) }
  let(:attendee) { create(:attendee) }
  let(:ticket) { create(:ticket, event_time: event_time, attendee: attendee) }

	context 'when logged in as event manager' do

		before do
		 login_as(event.manager)
		 visit event_event_time_path(event, event_time)
		end

		scenario 'user visits the event time show page' do
			expect(page).to have_content(attendee.first_name)
			expect(page).to have_content(attendee.last_name)
			expect(page).to have_content(attendee.email)			
		end
	end
end