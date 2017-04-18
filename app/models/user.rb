class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :managed_events, :foreign_key => "manager_id", :class_name => "Event", dependent: :destroy
  has_many :tickets, :foreign_key => "attendee_id", :class_name => "Ticket", dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end
end
