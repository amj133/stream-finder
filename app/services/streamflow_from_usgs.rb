class StreamflowFromUSGS

  def initialize(search_params)
    @search_params = search_params
  end

  def streamflow
    raw_streamflow = USGSStreamflowService.new(search_params).raw_streamflow
    parse_raw_response(raw_streamflow)
  end

  private
    attr_reader :search_params

    def parse_raw_response(raw_streamflow)
      time = []
      discharge = []
      raw_streamflow["value"]["timeSeries"].map do |time_series|
        time_series["values"][0]["value"].map do |time_and_discharge|
          time << time_and_discharge["dateTime"]
          discharge << time_and_discharge["value"]
        end
      end
      TimeSeries.new(time, discharge)
    end

end
