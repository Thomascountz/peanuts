class Event < ApplicationRecord
  belongs_to :manager, :class_name => "User"
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { minimum: 50, maximum: 450 }
  validates :location, presence: true
end
