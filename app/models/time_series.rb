require 'csv'

class TimeSeries
  attr_reader :discharge, :time_as_string

  def initialize(time_series)
    @time_as_string = time_series.keys
    @discharge = time_series.values.map {|q| q.to_f}
  end

  def time
    time_as_string.map do |time|
      DateTime.strptime(time, '%Y-%m-%dT%H:%M')
    end.sort
  end

  def as_csv
    headers = ['date_time', 'discharge (cfs)']

    csv = CSV.generate do |csv|
      csv << headers
      discharge.each_with_index do |discharge, i|
        csv << [time_as_string[i], discharge]
      end
    end
  end

end
