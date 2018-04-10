class StationsByHUC
  include WqpXmlParser

  def initialize(huc_code)
    @huc_code = huc_code
  end

  def stations
    response = raw_stations
    parse_array(response).map do |raw_station|
      Station.new(raw_station)
    end
  end

  private
    attr_reader :huc_code

    def raw_stations
      WQPService.new({"huc_code" => huc_code}).stations_by_huc
    end
end
