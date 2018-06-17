class WqpService

  def initialize(search_params = {})
    @search_params = search_params
  end

  def raw_stations
    params = base_params.merge!(search_params)
    xml_response("/data/Station/search", params)
  end

  private
    attr_reader :search_params

    def conn
      Faraday.new(url: "https://www.waterqualitydata.us/")
    end

    def base_params
      {"statecode" => "US:08"}
    end

    def send_get_request(uri, params)
      conn.get(uri, params)
    end

    def xml_response(uri, params)
      response = send_get_request(uri, params)
      Hash.from_xml(response.body)
    end

end
