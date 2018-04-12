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
      WQPService.new(search_params).stations
    end

    def stations_from_multiple_organizations(response)
      parse_array(response).map do |raw_station|
        Station.new(raw_station)
      end
    end

    def stations_from_single_organization(response)
      station_attrs = response["WQX"]["Organization"]["MonitoringLocation"]
      Station.new(station_attrs)
    end

end
