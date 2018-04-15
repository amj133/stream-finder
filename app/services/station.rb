class Station
  attr_reader :id, :name, :organization, :type, :description, :drainage_area,
  :drainage_area_units, :latitude, :longitude

  def initialize(attrs)
    @id = attrs["MonitoringLocationIdentity"]["MonitoringLocationIdentifier"]
    @name = attrs["MonitoringLocationIdentity"]["MonitoringLocationName"]
    @type = attrs["MonitoringLocationIdentity"]["MonitoringLocationTypeName"]
    @description = attrs["MonitoringLocationIdentity"]["MonitoringLocationDescriptionText"]
    @latitude = attrs["MonitoringLocationGeospatial"]["LatitudeMeasure"]
    @longitude = attrs["MonitoringLocationGeospatial"]["LongitudeMeasure"]
    if attrs["MonitoringLocationIdentity"]["DrainageAreaMeasure"]
      @drainage_area = attrs["MonitoringLocationIdentity"]["DrainageAreaMeasure"]["MeasureValue"]
      @drainage_area_units = attrs["MonitoringLocationIdentity"]["DrainageAreaMeasure"]["MeasureUnitCode"]
    end
  end
end
