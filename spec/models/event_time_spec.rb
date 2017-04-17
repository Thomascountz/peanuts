require 'rails_helper'

RSpec.describe EventTime, type: :model do
  describe 'validations and associations' do
    before(:each) { event_time = build(:event_time) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
    it { should belong_to(:event) }
  end

  describe 'end time validation' do

    it 'should be valid' do
      event_time = build(:event_time)
      expect(event_time).to be_valid
    end

    it 'should be invalid if end time is before start time' do
      event_time = build(:event_time, start_time: Time.zone.now + 2.hours,
                                      end_time:   Time.zone.now + 1.hours)
      expect(event_time).to be_invalid
    end
  end

  describe 'start time validation' do

    it 'should be valid' do
      event_time = build(:event_time)
      expect(event_time).to be_valid
    end

    it 'should be invalid if start time is after now' do
      event_time = build(:event_time, start_time: Time.zone.now - 2.hours)
      expect(event_time).to be_invalid
    end
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
