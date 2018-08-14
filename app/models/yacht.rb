class Yacht < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validates :location, presence: true
  validates :boat_type, presence: true
end
