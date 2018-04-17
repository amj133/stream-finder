class StationsPresenter

  def initialize(attrs = {})
    @huc = attrs[:huc]
    @site_id = attrs[:site_id]
  end

  def stations_by_huc
    check_db_or_fetch(:by_huc, "huc")
  end

  def station_by_id
    check_db_or_fetch(:by_id, "siteid")
  end

  private
    attr_reader :huc, :site_id

    def check_db_or_fetch(method, search_key)
      stations = StreamStation.send(method, search_params[search_key])
      unless stations[0].nil?
        stations
      else
        StationsFromWQP.new(search_params).stations
      end
    end

    def search_params
      {
        "huc" => huc,
        "siteid" => site_id
      }
    end

end
