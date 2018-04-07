class WQPService
  include XMLResponse

  def initialize(attrs = {})
    @huc_code = attrs["huc_code"]
    @station_id = attrs["station_id"]
  end

  def station_by_huc #change to stations!!!
    params = base_params.merge!({"huc" => huc_code})
    xml_response("/data/Station/search", params)
  end

  def station_by_id
    params = base_params.merge!({"siteid" => station_id})
    xml_response("/data/Station/search", params)
  end

  private
    attr_reader :huc_code, :station_id

    def base_params
      {
        "state" => "US:08"
      }
    end

end
