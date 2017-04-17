class EventTimesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

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

  def edit
    @event = Event.find(params[:event_id])
    @event_time = EventTime.find(params[:id])
  end

  def update
    @event = Event.find(params[:event_id])
    @event_time = EventTime.find(params[:id])
    if @event_time.update(event_time_params)
      flash[:success] = "Your event was updated!"
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @event_time = EventTime.find(params[:id])
    @event_time.destroy
    flash[:success] = "Your showtime was cancelled!"
    redirect_to event_path(@event)
  end

  private

    def event_time_params
      params.require(:event_time).permit(:start_time, :end_time)
    end
end
