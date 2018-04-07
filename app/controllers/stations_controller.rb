class StationsController < ApplicationController

  def index
    @co_watershed_hucs ||= CO_WATERSHED_HUCS
    @stations = StationsByHUC.new(params[:huc_code]).stations if params[:huc_code]
  end

end
