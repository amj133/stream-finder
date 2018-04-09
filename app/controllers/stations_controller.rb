class StationsController < ApplicationController
  before_action :require_current_user

  def index
    @co_watershed_hucs ||= CO_WATERSHED_HUCS
    if params[:huc_code]
      @stations = StationsByHUC.new(params[:huc_code]).stations
      @geojson = []
      transform_to_geojson(@stations, @geojson)
    end
    
    respond_to do |format|
      format.html
      format.json { render json: @geojson}
    end
  end

  def show
    @station = StationByID.new(params[:id]).station
  end


  private
    def require_current_user
      render file: "public/404" unless current_user
    end

    def transform_to_geojson(stations, geojson)
      stations.each do |station|
        geojson << GeojsonBuilder.build_station(station)
      end
    end

end
