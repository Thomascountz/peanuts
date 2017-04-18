class EventTime < ApplicationRecord
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time
  validate :start_time_after_now
  belongs_to :event
  has_many :tickets, dependent: :destroy
  default_scope -> { order(start_time: :asc) }
  scope :upcoming, -> { where('start_time >= ?', Time.zone.now) }
  scope :past, -> { where('start_time <= ?', Time.zone.now) }

  # returns true if the event hasn't begun yet
  def upcoming?
    start_time >= Time.zone.now
  end

  private

  # validates end time is after start time
  def end_time_after_start_time
    if start_time.present? && end_time.present?
      if end_time <= start_time
        errors.add(:end_time, "must be after start time")
      end
    end
  end

  # validates start time is after now
  def start_time_after_now
    if start_time.present?
      if start_time <= Time.zone.now
        errors.add(:start_time, "must be in the future")
      end
    end
  end

end
