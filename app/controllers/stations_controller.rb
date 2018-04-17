class StationsController < ApplicationController
  before_action :require_current_user

  def index
    @co_watershed_hucs = CO_WATERSHED_HUCS
    if params[:huc_code]
      @stations = StationsPresenter.new(huc: params[:huc_code]).stations_by_huc
    end
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
