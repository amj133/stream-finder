class Station
  attr_reader :id, :name, :organization, :type, :description, :drainage_area,
  :drainage_area_units, :latitude, :longitude

  def initialize(attrs)
    @id = attrs["MonitoringLocationIdentity"]["MonitoringLocationIdentifier"]
    @name = attrs["MonitoringLocationIdentity"]["MonitoringLocationName"]
    @type = attrs["MonitoringLocationIdentity"]["MonitoringLocationTypeName"]
    @description = attrs["MonitoringLocationIdentity"]["MonitoringLocationDescriptionText"]
    @drainage_area = attrs["MonitoringLocationIdentity"]["DrainageAreaMeasure"]["MeasureValue"]
    @drainage_area_units = attrs["MonitoringLocationIdentity"]["DrainageAreaMeasure"]["MeasureUnitCode"]
    @latitude = attrs["MonitoringLocationGeospatial"]["LatitudeMeasure"]
    @longitude = attrs["MonitoringLocationGeospatial"]["LongitudeMeasure"]
  end

end
