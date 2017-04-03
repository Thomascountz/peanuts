require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'invalid user' do
    it 'is invalid without a first name' do
      user = build(:user, first_name: nil)
      expect(user).to_not be_valid
    end
    it 'is invalid without a last name' do
      user = build(:user, last_name: nil)
      expect(user).to_not be_valid
    end
  end
  
  describe '#full_name' do
    it 'returns first and last name' do
      user = build(:user, first_name: "Joe", last_name: "Schmoe")
      expect(user.full_name).to eq("Joe Schmoe")
    end
  end
end
