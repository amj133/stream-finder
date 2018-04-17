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

  private
    attr_reader :huc, :site_id, :siteType, :countycode

    def check_db_or_fetch(search_method, search_key)
      stations = StreamStation.send(search_method, search_params[search_key])
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
