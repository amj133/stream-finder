class StationsPresenter

  def initialize(attrs = {})
    @huc = attrs[:huc]
  end

  def stations_by_huc
    search_params = {"huc" => huc}
    check_db_or_fetch(search_params)
  end

  private
    attr_reader :huc

    def check_db_or_fetch(search_params)
      stations = StreamStation.by_huc(search_params["huc"])
      unless stations[0].nil?
        stations
      else
        StationsFromWQP.new(search_params).stations
      end
    end


end
