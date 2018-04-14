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
      time_series = {}
      raw_streamflow["value"]["timeSeries"].map do |time_series_raw|
        time_series_raw["values"][0]["value"].map do |time_and_q|
          time_series[time_and_q["dateTime"]] = time_and_q["value"] unless time_series[time_and_q["dateTime"]]
        end
      end
      TimeSeries.new(time_series)
    end

end
