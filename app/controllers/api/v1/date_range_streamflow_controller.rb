class Api::V1::DateRangeStreamflowController < ApplicationController

  def show
    search_params = {"site" => params[:id], "startDT" => params[:startDate], "endDT" => params[:endDate]}
    streamflow = StreamflowFromUSGS.new(search_params).streamflow

    render json: streamflow
  end

  private

  def date_range_streamflow_params
    params.permit(:start_date, :end_date)
  end

end
