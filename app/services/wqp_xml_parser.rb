module WqpXmlParser

  def parse_array(response)
    parse_into_organizations(response).map do |org|
      org["MonitoringLocation"]
    end.flatten
  end

  def parse_into_organizations(response)
    response["WQX"]["Organization"].map {|org| org}
  end

end
