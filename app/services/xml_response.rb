module XMLResponse
  # add WQP to module name

  def xml_response(uri, params)
    response = send_get_request(uri, params)
    Hash.from_xml(response.body)
  end

  private
    def conn
      Faraday.new(url: "https://www.waterqualitydata.us/")
    end

    def send_get_request(uri, params)
      conn.get(uri, params)
    end
end
