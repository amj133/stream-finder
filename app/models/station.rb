class Station < ApplicationRecord
  validates :organization, :location_id, :huc_8, presence: true
  validates :latitude, :longitude, :provider, presence: true
end
