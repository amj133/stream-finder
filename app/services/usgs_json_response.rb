module USGSJsonResponse

  def json_response(uri, params)
    response = send_get_request(uri, params)
    JSON.parse(response.body)
  end

  private
    def conn
      Faraday.new 'http://waterservices.usgs.gov' do |conn|
        conn.use FaradayMiddleware::FollowRedirects, limit: 5
        conn.adapter Faraday.default_adapter
      end
    end

    def send_get_request(uri, params)
      conn.get(uri, params)
    end

end
