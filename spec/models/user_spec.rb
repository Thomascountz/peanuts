require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe '#full_name' do
    it 'returns first and last name' do
      user = build(:user, first_name: "Joe", last_name: "Schmoe")
      expect(user.full_name).to eq("Joe Schmoe")
    end
  end
end
