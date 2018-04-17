class StationsPresenter

  def initialize(attrs = {})
    @huc = attrs[:huc]
    @site_type = attrs[:siteType]
    @site_id = attrs[:siteid]
    @county_code = attrs[:countycode]
  end

  def stations_by_huc
    check_db_or_fetch(:by_huc, "huc")
  end

  def station_by_id
    check_db_or_fetch(:by_id, "siteid")
  end

  def stations_by_map_search
    check_db_or_fetch(:map_search)
  end

  private
    attr_reader :huc, :site_id, :site_type, :countycode

    def check_db_or_fetch(search_method, search_key = nil)
      search_key.nil? ? params = search_params : params = search_params[search_key]
      stations = StreamStation.send(search_method, params)
      if stations.nil? || (stations[0].nil? && stations.class != StreamStation)
        StationsFromWQP.new(search_params).stations
      else
        stations
      end
    end

    def search_params
      {
        "huc" => huc,
        "siteid" => site_id,
        "siteType" => site_type,
        "countycode" => countycode
      }.compact
    end

end
