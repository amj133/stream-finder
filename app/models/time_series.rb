class TimeSeries
  attr_reader :discharge

  def initialize(time_series)
    @time_as_string = time_series.keys
    @discharge = time_series.values.map {|q| q.to_f}
  end

  def time
    time_as_string.map do |time|
      DateTime.strptime(time, '%Y-%m-%dT%H:%M')
    end.sort
  end

  private
    attr_reader :time_as_string

end
