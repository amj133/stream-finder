class StationsFromWQP
  include WqpXmlParser

  def initialize(search_params = {})
    @search_params = search_params
  end

  def stations
    response = raw_stations

    if response["WQX"]["Organization"].class == Array
      stations_from_multiple_organizations(response)
    elsif response["WQX"]["Organization"].class == Hash
      stations_from_single_organization(response)
    end
  end

  def favorite_station
    add_to_favorite_stations(stations)
  end

  private
    attr_reader :search_params

    def raw_stations
      WqpService.new(search_params).raw_stations
    end

    def stations_from_multiple_organizations(response)
      parse_array(response).map do |raw_station|
        Station.new(raw_station)
      end
    end

    def stations_from_single_organization(response)
      raw_stations = response["WQX"]["Organization"]["MonitoringLocation"]
      return Station.new(raw_stations) if raw_stations.class == Hash
      stations = response["WQX"]["Organization"]["MonitoringLocation"].map do |raw_station|
        Station.new(raw_station)
      end
    end

    def add_to_favorite_stations(station)
      FavoriteStation.new({
        org_id: station.org_id,
        name: station.name,
        huc: station.huc,
        county_code: station.county_code,
        type_of: station.type_of,
        description: station.description,
        latitude: station.latitude,
        longitude: station.longitude,
        drainage_area: station.drainage_area,
        drainage_area_units: station.drainage_area_units
      })
    end

end
