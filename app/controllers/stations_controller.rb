class StationsController < ApplicationController
  before_action :require_current_user

  def index
    @co_watershed_hucs = CO_WATERSHED_HUCS
    if params[:huc_code]
      @stations = StationsPresenter.new(huc: params[:huc_code]).stations_by_huc
    end
  end

  def show
    @station = StationsPresenter.new(siteid: params[:id]).station_by_id
  end

end
