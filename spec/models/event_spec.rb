require 'rails_helper'

RSpec.describe Event, type: :model do

  describe 'validations' do
    before(:each) { event = build(:event) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_least(50)}
    it { should validate_length_of(:description).is_at_most(450)}
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:manager_id) }
    it { should belong_to(:manager).class_name('User') }
  end
end
