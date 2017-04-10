class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :managed_events, :foreign_key => "manager_id", :class_name => "Event"

  def full_name
    "#{first_name} #{last_name}"
  end
end
