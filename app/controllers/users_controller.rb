class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  
  def dashboard
    @user = current_user
  end
end
