class Station
  attr_reader :org_id, :name, :organization, :huc, :type_of, :description, :drainage_area,
  :drainage_area_units, :latitude, :longitude, :county_code

  def initialize(attrs)
    @org_id = attrs["MonitoringLocationIdentity"]["MonitoringLocationIdentifier"]
    @name = attrs["MonitoringLocationIdentity"]["MonitoringLocationName"]
    @huc = attrs["MonitoringLocationIdentity"]["HUCEightDigitCode"]
    @type_of = attrs["MonitoringLocationIdentity"]["MonitoringLocationTypeName"]
    @description = attrs["MonitoringLocationIdentity"]["MonitoringLocationDescriptionText"]
    @county_code = attrs["MonitoringLocationGeospatial"]["CountyCode"]
    @latitude = attrs["MonitoringLocationGeospatial"]["LatitudeMeasure"]
    @longitude = attrs["MonitoringLocationGeospatial"]["LongitudeMeasure"]
    if attrs["MonitoringLocationIdentity"]["DrainageAreaMeasure"]
      @drainage_area = attrs["MonitoringLocationIdentity"]["DrainageAreaMeasure"]["MeasureValue"]
      @drainage_area_units = attrs["MonitoringLocationIdentity"]["DrainageAreaMeasure"]["MeasureUnitCode"]
    end
  end
end
