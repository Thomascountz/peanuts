class TicketsController < ApplicationController

  def create
  	event_time = EventTime.find(params[:ticket][:event_time_id])
  	attendee = User.find(params[:ticket][:attendee_id])
  	ticket = Ticket.new(event_time: event_time, attendee: attendee)
  	if ticket.save
  		flash[:success] = "You've purchsed a ticket for #{event_time.event.title}!"
  		redirect_to dashboard_url
 		end
  end

end
