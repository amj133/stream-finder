class Api::V1::StreamflowController < ApplicationController

  def index
    search_params = {"site" => params[:station_id], "period" => "P1D"}
    streamflow = StreamflowFromUSGS.new(search_params).streamflow

    render json: streamflow
  end

end
