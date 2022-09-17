class Api::V1::DateRangeStreamflowController < ApplicationController

  def show
    search_params = {"site" => params[:id], "startDT" => params[:startDate], "endDT" => params[:endDate]}
    streamflow = StreamflowFromUSGS.new(search_params).streamflow

    render json: streamflow
  end

  def download
    search_params = {"site" => params[:id], "startDT" => params[:startDate], "endDT" => params[:endDate] }
    begin
      streamflow = StreamflowFromUSGS.new(search_params).streamflow
    rescue InvalidParameterError => e
      response = {}
      response[:errors] = e.api_error_messages

      return render :json => response, :status => 400
    end

    respond_to do |format|
      format.csv { send_data(streamflow.as_csv, :type => 'text/csv') }
    end
  end

  private

  def date_range_streamflow_params
    params.permit(:start_date, :end_date)
  end

end
