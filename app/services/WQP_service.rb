class WqpService
  include XMLResponse

  def initialize(search_params = {})
    @search_params = search_params
  end

  def raw_stations
    params = base_params.merge!(search_params)
    xml_response("/data/Station/search", params)
  end

  private
  
    attr_reader :search_params

    def base_params
      {
        "statecode" => "US:08"
      }
    end

end
