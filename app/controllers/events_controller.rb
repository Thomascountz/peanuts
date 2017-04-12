class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

  def new
    @event = current_user.managed_events.build
  end

  def create
    @event = current_user.managed_events.build(event_params)
    if @event.save
      flash[:success] = "Your event was created!"
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:success] = "Your event was updated!"
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end

  private

    def event_params
      params.require(:event).permit(:title, :description, :location)
    end
end
