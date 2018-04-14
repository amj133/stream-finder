class TimeSeriesSerializer < ActiveModel::Serializer
  attributes :time, :discharge

  def time
    object.time.map do |datetime|
      datetime.strftime('%Y %m %d %H %M')
    end
  end

  def discharge
    object.discharge
  end
end
