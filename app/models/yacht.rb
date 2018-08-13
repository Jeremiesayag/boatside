class Yacht < ApplicationRecord
  belongs_to :user
  validates :name, presence :true, uniqueness :true
  validates :location, presence :true
  validates :boat_type, presence :true
end