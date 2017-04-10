class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @event = current_user.managed_events.build
  end

  def create
    @event = current_user.managed_events.build(event_params)
    if @event.save
      flash[:success] = "Event successfully created!"
      redirect_to dashboard_url
    else
      render 'new'
    end
  end

  private

    def event_params
      params.require(:event).permit(:title, :description, :location)
    end

end
