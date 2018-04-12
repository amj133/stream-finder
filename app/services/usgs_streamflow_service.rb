class USGSStreamflowService
  include USGSJsonResponse

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
      {
        "format" => "json",
        "period" => "P1D"
      }
    end
end
