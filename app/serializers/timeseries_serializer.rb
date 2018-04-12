class TimeseriesSerializer < ActiveModel::Serializer
  attributes :time, :discharge

  def time
    object.time.map do |datetime|
      datetime.strftime('%M/%d/%Y-%H:%M')
    end
  end
end
