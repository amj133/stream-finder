class StreamStation < ApplicationRecord
  validates_presence_of :org_id
  validates_presence_of :type_of
  validates_presence_of :latitude
  validates_presence_of :longitude
  has_many :stream_station_projects
  has_many :projects, through: :stream_station_projects

  def self.validate_huc(huc)
    if huc.match(/^\d{8}$/).nil?
      raise InvalidParameterError.new("HUC code must be exactly 8 digits long")
    end
  end

  def self.validate_station_type(type)
    valid_types = [
      "Aggregate groundwater use",
      "Aggregate groundwater use ",
      "Aggregate surface-water-use",
      "Aggregate water-use establishment",
      "Atmosphere",
      "Estuary",
      "Facility",
      "Glacier",
      "Lake, Reservoir, Impoundment",
      "Land",
      "Not Assigned",
      "Ocean",
      "Spring",
      "Stream",
      "Subsurface",
      "Well",
      "Wetland",
    ]

    if !valid_types.include?(type)
      raise InvalidParameterError.new("Please click on link next the field for a list of valid station types")
    end
  end

  def self.validate_county_code(county_code)
    if county_code.match(/^\d{3}$/).nil?
      raise InvalidParameterError.new("County code must be exactly 3 digits long")
    end
  end

  def self.validate_county_code(county_code)
    if county_code.match(/^\d{3}$/).nil?
      raise InvalidParameterError.new("County code must be exactly 3 digits long")
    end
  end

  def self.validate_drainage_area_range(drainage_area_range)
    if drainage_area_range.match(/^\d{1,9}\s*-\s*\d{1,9}$/).nil?
      raise InvalidParameterError.new("Drainage area range must be in the form of [number]-[number], e.g. 150-400")
    end
  end

  def self.by_huc(huc)
    validate_huc(huc)
    where(huc: huc)
  end

  def self.by_id(id)
    find_by(org_id: id)
  end

  def self.by_type(type)
    validate_station_type(type)
    where(type_of: type)
  end

  def self.by_multiple_params(search_params)
    scope = all

    if search_params["huc"].nil?
      scope = scope.where("huc IS NOT NULL")
    else
      validate_huc(search_params["huc"])
      scope = scope.where("huc = ?", search_params['huc'])
    end

    if search_params["siteType"].nil?
      scope = scope.where("type_of IS NOT NULL")
    else
      validate_station_type(search_params["siteType"])
      scope = scope.where("type_of = ?", search_params['siteType'])
    end

    if search_params["siteid"].nil?
      scope = scope.where("org_id IS NOT NULL")
    else
      scope = scope.where("org_id = ?", search_params['siteid'])
    end

    if search_params["countycode"].nil?
      scope = scope.where("county_code IS NOT NULL")
    else
      validate_county_code(search_params["countycode"])
      scope = scope.where("county_code = ?", search_params['countycode'].split(':')[2])
    end

    if search_params["drainage_area"].nil?
      scope = scope.where("drainage_area IS NOT NULL")
    else
      validate_drainage_area_range(search_params["drainage_area"])
      min = search_params['drainage_area'].split('-')[0]
      max = search_params['drainage_area'].split('-')[1]
      scope = scope.where("drainage_area >= ? AND drainage_area <= ?", min, max)
    end

    scope
  end
end
