class WQPService
  include XMLResponse

  def initialize(attrs = {})
    @huc_code = attrs["huc_code"]
  end

  def station_by_huc
    xml_response("/Station/search", params)
  end

  private
    attr_reader :huc_code

    def params # make base_params & do params = base_params.merge(additional)
      {
        "state" => "US:08",
        "huc" => huc_code
      }
    end

end
