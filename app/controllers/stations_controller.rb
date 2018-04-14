class StationsController < ApplicationController
  before_action :require_current_user

  def index
    @co_watershed_hucs = CO_WATERSHED_HUCS
    search_params = {"huc" => params[:huc_code]}
    @stations = StationsFromWQP.new(search_params).stations if params[:huc_code]
  end

  def show
    @station = StationsFromWQP.new({"siteid" => params[:id]}).stations
    @station_id = @station.id.split("-")[1]
  end


  private
    def require_current_user
      render file: "public/404" unless current_user
    end

end
