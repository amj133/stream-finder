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
      WQPService.new(params).stations
    end

    def params
      {"huc" => huc_code}
    end
end
