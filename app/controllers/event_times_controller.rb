class EventTimesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @event = Event.find(params[:event_id])
    @event_time = @event.event_times.build
  end

  def create

  end
end
