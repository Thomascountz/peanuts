class Event < ApplicationRecord
  belongs_to :manager, :class_name => "User"
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 50, maximum: 450 }
  validates :location, presence: true
  validates :manager_id, presence: true
end
