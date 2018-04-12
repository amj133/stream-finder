class TimeSeries
  attr_reader :time, :discharge

  def initialize(time_collection, discharge_collection)
    @time = time_collection
    @discharge = discharge_collection.map {|q| q.to_i}
  end

end
