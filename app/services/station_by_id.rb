class StationByID

  def initialize(station_id)
    @station_id = station_id
  end

  def station
    raw_response = WQPService.new({"station_id" => station_id}).station_by_id
    station_attrs = raw_response["WQX"]["Organization"]["MonitoringLocation"]
    Station.new(station_attrs)
  end

  private
    attr_reader :station_id

end
