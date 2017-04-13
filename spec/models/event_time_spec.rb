require 'rails_helper'

RSpec.describe EventTime, type: :model do
  before(:each) { event_time = build(:event_time) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
  it { should belong_to(:event) }
end
