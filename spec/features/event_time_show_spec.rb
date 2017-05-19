require 'rails_helper'

RSpec.feature "event time show page", :type => :feature do  

	let(:event) { create(:event) }
  let(:event_time) { create(:event_time, event: event) }
  let(:ticket) { create (:ticket) }
  let(:attendee) { ticket.attendee }

	context 'when logged in as event manager' do

		before do
		 login_as(event.manager)
		 visit event_time_path(event_time)
		end

		scenario 'user visits the event time show page' do
			expect(page).to have_content(attendee.first_name)
			expect(page).to have_content(attendee.last_name)
			expect(page).to have_content(attendee.email)			
		end
	end
end