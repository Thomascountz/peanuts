require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the EventTimesHelper. For example:
#
# describe EventTimesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe EventTimesHelper, type: :helper do
  describe 'datetime formatter' do
  	it 'returns datetime objects in a human readable format' do
  		expect(helper.datetime_formatter(DateTime.new(2012, 07, 11, 20, 10, 0))).to eq("Wednesday Jul 11 @  8:10 PM")
  	end
  end
end
