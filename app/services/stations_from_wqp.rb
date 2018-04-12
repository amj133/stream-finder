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

  private
    attr_reader :search_params

    def raw_stations
      WQPService.new(search_params).raw_stations
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

end
