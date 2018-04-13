class TimeSeries
  attr_reader :discharge

  def initialize(time_collection, discharge_collection)
    @time_as_string = time_collection
    @discharge = discharge_collection.map {|q| q.to_f}
  end

  def time
    time_as_string.map do |time|
      DateTime.strptime(time, '%Y-%m-%dT%H:%M')
    end
  end

  private
    attr_reader :time_as_string

end
