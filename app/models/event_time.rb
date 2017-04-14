class EventTime < ApplicationRecord
  validates :start_time, presence: true
  validates :end_time, presence: true
  # NOT WORKING
  validate :start_time_before_end_time
  belongs_to :event
  default_scope -> { order(start_time: :asc) }
  scope :upcoming, -> { where('start_time >= ?', Time.zone.now) }
  scope :past, -> { where('start_time <= ?', Time.zone.now) }

  # returns true if the event hasn't begun yet
  def upcoming?
    start_time >= Time.zone.now
  end

  private

  # NOT WORKING
  def start_time_before_end_time
    if self.start_time >= self.end_time
      errors.add(:end_time, "must be after start time")
    end
  end
end
