class Yacht < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validates :location, presence: true
  validates :boat_type, presence: true
  
  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :search_by_location_and_boat_type,
    against: [ :location, :boat_type ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
