class Yacht < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validates :location, presence: true
  validates :boat_type, presence: true

  include PgSearch
  pg_search_scope :search_by_location_and_boat_type,
    against: [ :location, :boat_type ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  mount_uploader :photo, PhotoUploader
end
