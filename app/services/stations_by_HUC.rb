class StationsByHUC
  include WqpXmlParser

  def initialize(huc_code)
    @huc_code = huc_code
  end

  def stations
    response = raw_stations
    binding.pry
    if response["WQX"]["Organization"].class == Array
      parse_array(response).map do |raw_station|
        Station.new(raw_station)
      end
    else
      response["WQX"]["Organization"]["MonitoringLocation"].map do |raw_station|
        Station.new(raw_station)
      end
    end
  end

  private
    attr_reader :huc_code

    def raw_stations
      WQPService.new({"huc_code" => huc_code}).station_by_huc
    end
end
