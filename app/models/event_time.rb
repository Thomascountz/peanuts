class EventTime < ApplicationRecord
  validates :start_time, presence: true
  validates :end_time, presence: true
  belongs_to :event
  default_scope -> { order(start_time: :asc) }
  scope :upcoming, -> { where('start_time >= ?', Time.zone.now) }
  scope :past, -> { where('start_time <= ?', Time.zone.now) }

  # returns true if the event hasn't begun yet
  def upcoming?
    start_time >= Time.zone.now
  end
end
