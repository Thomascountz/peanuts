require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'validations and associations' do
    before(:each) { ticket = build(:ticket) }
    it { should validate_presence_of(:attendee_id) }
    it { should validate_presence_of(:event_time_id) }
    it { should belong_to(:event_time) }
    it { should belong_to(:attendee)}
  end
end
