class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @ticket = Ticket.new
  end

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
    unless current_user == @event.manager
      flash[:danger] = "Something went wrong."
      redirect_to dashboard_path 
    end
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

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = "Your event was cancelled!"
    redirect_to dashboard_url
  end

  private

    def event_params
      params.require(:event).permit(:title, :description, :location)
    end
end
