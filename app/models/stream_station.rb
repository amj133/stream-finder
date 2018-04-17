class StreamStation < ApplicationRecord
  validates_presence_of :org_id
  validates_presence_of :type_of
  validates_presence_of :latitude
  validates_presence_of :longitude
  # has_many :favorite_station_projects
  # has_many :projects, through: :favorite_station_projects

  def self.by_huc(huc)
    where(huc: huc)
  end

  def self.by_id(id)
    find_by(org_id: id)
  end

  def self.by_type(type)
    where(type_of: type)
  end

  def self.map_search(search_params)
    huc = search_params["huc"]
    type = search_params["siteType"]
    if huc && type
      where("huc = ? AND type_of = ?", huc, type)
    elsif huc
      by_huc(huc)
    elsif type
      by_type(type)
    end
  end
end
