class StationsFromWQP
  include WqpXmlParser

  def initialize(search_params = {})
    @search_params = search_params
  end

  def stations
    response = raw_stations
    parse_array(response).map do |raw_station|
      Station.new(raw_station)
    end
  end

  private
    attr_reader :search_params

    def raw_stations
      WQPService.new(search_params).stations
    end

end
