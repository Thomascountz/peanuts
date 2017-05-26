module ApplicationHelper

	def datetime_formatter(datetime)
		datetime.strftime('%A %b %e @ %l:%M %p')
	end
	
end
