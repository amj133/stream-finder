class TimeSeries
  attr_reader :time, :discharge

  def initialize(time, discharge)
    @time = time
    @discharge = discharge
  end

end
