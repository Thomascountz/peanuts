require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'valididations' do
    before (:each) { user = build(:user) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe '#destroy' do
    it 'destroy any associated events' do
      manager = create(:user)
      create(:event, manager: manager)
      expect { manager.destroy }.to change { Event.count }.by(-1)
    end
  end

  describe '#full_name' do
    it 'returns first and last name' do
      user = build(:user, first_name: "Joe", last_name: "Schmoe")
      expect(user.full_name).to eq("Joe Schmoe")
    end
  end
end
