class FavoriteStation < ApplicationRecord
  validates_presence_of :org_id
  validates_presence_of :type_of
  validates_presence_of :latitude
  validates_presence_of :longitude
  has_many :favorite_station_projects
  has_many :projects, through: :favorite_station_projects
end
