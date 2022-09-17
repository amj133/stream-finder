class USGSStreamflowService

  def initialize(search_params)
    @search_params = search_params
  end

  def raw_streamflow
    params = base_params.merge!(search_params)
    response = json_response('/nwis/iv', params)
  end

  private
    attr_reader :search_params

    def base_params
      {"format" => "json"}
    end

    def conn
      Faraday.new 'http://waterservices.usgs.gov' do |conn|
        conn.use FaradayMiddleware::FollowRedirects, limit: 5
        conn.adapter Faraday.default_adapter
      end
    end

    def send_get_request(uri, params)
      conn.get(uri, params)
    end

    def json_response(uri, params)
      response = send_get_request(uri, params)

      if !response.success?
        raise InvalidParameterError.new("Use the 'View Historical Streamflow' button to verify streamflow data is available in date range of interest before downloading")
      end

      JSON.parse(response.body)
    end

end
