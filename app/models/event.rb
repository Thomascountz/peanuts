class Event < ApplicationRecord
  belongs_to :manager, :foreign_key => :manager_id, :class_name => "User"
  has_many :event_times, dependent: :destroy
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { minimum: 50, maximum: 450 }
  validates :location, presence: true, length: { maximum: 250 }
end
