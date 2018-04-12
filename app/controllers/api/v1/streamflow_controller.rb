class Api::V1::StreamflowController < ApplicationController

  def index
    station_id = params[:station_id]
    streamflow = StreamflowFromUSGS.new(station_id).streamflow

    render json: streamflow
  end

end
