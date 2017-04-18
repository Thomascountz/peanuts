class Ticket < ApplicationRecord
  validates :attendee_id, presence: true
  validates :event_time_id, presence: true
  belongs_to :attendee, :foreign_key => :attendee_id, :class_name => "User"
  belongs_to :event_time
end
