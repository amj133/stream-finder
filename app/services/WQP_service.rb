class WQPService
  include XMLResponse

  def initialize(attrs = {})
    @attrs = attrs
  end

  def stations
    params = base_params.merge!(attrs)
    xml_response("/data/Station/search", params)
  end

  private
    attr_reader :attrs

    def base_params
      {
        "statecode" => "US:08"
      }
    end

end
