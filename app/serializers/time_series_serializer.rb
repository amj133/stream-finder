class TimeSeriesSerializer < ActiveModel::Serializer
  attributes :time, :discharge

  def time
    object.time.map do |datetime|
      datetime.strftime('%m/%d/%Y-%H:%M')
    end
  end

  def discharge
    object.discharge
  end
end
