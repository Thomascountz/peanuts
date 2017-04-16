class EventTimesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @event = Event.find(params[:event_id])
    @event_time = @event.event_times.build
  end

  def create
    @event = Event.find(params[:event_id])
    @event_time = @event.event_times.build(event_time_params)
    if @event_time.save
      flash[:success] = "Your event was created!"
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  private

    def event_time_params
      params.require(:event_time).permit(:start_time, :end_time)
    end
end
