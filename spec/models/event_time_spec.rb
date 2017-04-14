require 'rails_helper'

RSpec.describe EventTime, type: :model do
  describe 'validations and associations' do
    before(:each) { event_time = build(:event_time) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
    it { should belong_to(:event) }
  end
  describe '#upcoming?' do
    it 'returns true if the event is starting after now' do
      event_time = build_stubbed(:event_time, start_time: Time.zone.now + 1.hour)
      expect(event_time.upcoming?).to be true
    end
    it 'returns false if the event has started in the past' do
      event_time = build_stubbed(:event_time, start_time: Time.zone.now - 1.hour)
      expect(event_time.upcoming?).to be false
    end
  end
end
