class FavoriteStationProject < ApplicationRecord
  belongs_to :project
  belongs_to :favorite_station
  # this is a test
end
