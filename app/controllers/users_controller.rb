class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  
  def show
    @user = current_user
    if current_user != @user
      flash[:alert] = "Oops, something went wrong!"
      redirect_to root_url
    end
  end
  
end
