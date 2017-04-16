class EventTime < ApplicationRecord
  validates :start_time, presence: true
  validates :end_time, presence: true
  # TODO Add validation to ensure start time is not in the past
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

  # validates start time is before end time
  def start_time_before_end_time
    if start_time.present? && end_time.present?
      if start_time >= end_time
        errors.add(:end_time, "must be after start time")
      end
    end
  end
end
