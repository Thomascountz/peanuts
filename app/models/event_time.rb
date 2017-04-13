class EventTime < ApplicationRecord
  validates :start_time, presence: true
  validates :end_time, presence: true
  belongs_to :event
end
