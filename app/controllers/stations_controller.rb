class StationsController < ApplicationController
  before_action :require_current_user

  def index
    @co_watershed_hucs ||= CO_WATERSHED_HUCS
    @stations = StationsByHUC.new(params[:huc_code]).stations if params[:huc_code]
  end

  def show
    @station = StationByID.new(params[:id]).station
  end

  private
    def require_current_user
      render "public/404" unless current_user
    end

end
