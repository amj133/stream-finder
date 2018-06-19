class StationsPresenter

  def initialize(attrs = {})
    @huc = attrs[:huc]
    @site_type = attrs[:siteType]
    @site_id = attrs[:siteid]
    @county_code = attrs[:countycode]
    @drainage_area = attrs[:drainageArea]
  end

  def stations_by_huc
    check_db_or_fetch(:by_huc, "huc")
  end

  def station_by_id
    station = check_db_or_fetch(:by_id, "siteid")
    station.class == Array ? station.first : station
  end

  def stations_by_multiple_params
    check_db_or_fetch(:by_multiple_params)
  end

  private
    attr_reader :huc, :site_id, :site_type, :county_code, :drainage_area

    def check_db_or_fetch(search_method, search_key = nil)
      stations = StreamStation.send(search_method, stream_params(search_key))
      if stations.nil? || (stations[0].nil? && stations.class != StreamStation)
        [StationsFromWQP.new(search_params).stations].flatten
      else
        stations
      end
    end

    def stream_params(search_key)
      search_key.nil? ? search_params : search_params[search_key]
    end

    def search_params
      {
        "huc" => huc,
        "siteid" => site_id,
        "siteType" => site_type,
        "countycode" => county_code,
        "drainage_area" => drainage_area
      }.compact
    end

end
