require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe "GET dashboard" do
    
    context 'when user is signed in' do
      let(:user) { create(:user) }
      
      it "returns http success" do
        sign_in user
        get :dashboard
        expect(response).to be_success
      end
    end

    context 'when user not signed in' do
      it "returns http redirect" do
        get :dashboard
        expect(response).to be_redirect
      end
    end
  end

end
