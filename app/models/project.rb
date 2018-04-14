class Project < ApplicationRecord
  belongs_to :user
  has_many :favorite_station_projects
  has_many :favorite_stations, through: :favorite_station_projects

  validates_presence_of :name, :huc
  validates_uniqueness_of :name
  before_save :generate_slug

  private
    def generate_slug
      self.slug = name.parameterize unless name.nil?
    end
end
