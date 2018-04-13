class StationsController < ApplicationController
  before_action :require_current_user

  def index
    @co_watershed_hucs = CO_WATERSHED_HUCS
    search_params = {"huc" => params[:huc_code]}
    @stations = StationsFromWQP.new(search_params).stations if params[:huc_code]
  end

  def show
    @station = StationsFromWQP.new({"siteid" => params[:id]}).stations

    # TESTING FOR CHART
    # attributes =
    # {
    #   "MonitoringLocationIdentity"=>
    #     {"MonitoringLocationIdentifier"=>"11NPSWRD-GRSA_NURE_0145",
    #      "MonitoringLocationName"=>"C29663",
    #      "MonitoringLocationTypeName"=>"River/Stream",
    #      "MonitoringLocationDescriptionText"=>"The station...",
    #      "DrainageAreaMeasure"=>
    #        {"MeasureValue"=>"120", "MeasureUnitCode"=>"sq mi"}},
    #   "MonitoringLocationGeospatial"=>
    #     {"LatitudeMeasure"=>"37.5636",
    #      "LongitudeMeasure"=>"-105.4392"}
    # }
    # @station = Station.new(attributes)
  end


  private
    def require_current_user
      render file: "public/404" unless current_user
    end

end
