module XMLResponse

  def xml_response(uri, params)
    response = send_get_request(uri, params)
    Hash.from_xml(response.body)
  end

  private
    def conn # /data not part of home path
      Faraday.new(url: "https://www.waterqualitydata.us/data")
    end

    def send_get_request(uri, params)
      conn.get(uri, params)
    end
end
