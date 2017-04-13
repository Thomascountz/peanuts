class EventTime < ApplicationRecord
  validates :start_time, presence: true
  validates :end_time, presence: true
  belongs_to :event
  default_scope -> { order(start_time: :desc) }
  scope :upcoming, -> { where('start_time >= ?', Time.zone.now) }
  scope :past, -> { where ('start_time <= ?', Time.zone.now) }
end
