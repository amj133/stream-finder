class StreamStation < ApplicationRecord
  validates_presence_of :org_id
  validates_presence_of :type_of
  validates_presence_of :latitude
  validates_presence_of :longitude
  has_many :stream_station_projects
  has_many :projects, through: :stream_station_projects

  def self.by_huc(huc)
    where(huc: huc)
  end

  def self.by_id(id)
    find_by(org_id: id)
  end

  def self.by_type(type)
    where(type_of: type)
  end

  def self.by_multiple_params(search_params)
    huc_search = "huc IS NOT NULL" if search_params["huc"].nil?
    huc_search = "huc = '#{search_params['huc']}'" if search_params["huc"] != nil

    type_search = "type_of IS NOT NULL" if search_params["siteType"].nil?
    type_search = "type_of = '#{search_params['siteType']}'" if search_params["siteType"] != nil

    id_search = "org_id IS NOT NULL" if search_params["siteid"].nil?
    id_search = "org_id = '#{search_params['siteid']}'" if search_params["siteid"] != nil

    county_search = "county_code IS NOT NULL" if search_params["countycode"].nil?
    county_search = "county_code = '#{search_params['countycode'].split(':')[2]}'" if search_params["countycode"] != nil

    if search_params["drainage_area"].nil?
      da_search = ""
    else
      min = search_params['drainage_area'].split('-')[0]
      max = search_params['drainage_area'].split('-')[1]
      da_search = "AND drainage_area >= #{min} AND drainage_area <= #{max}"
    end

    query = "#{huc_search} AND #{type_search} AND #{id_search} AND #{county_search} #{da_search}"
    where(query)
  end
end
