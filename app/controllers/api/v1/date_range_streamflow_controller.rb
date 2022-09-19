class Api::V1::DateRangeStreamflowController < ApplicationController

  def show
    search_params = {"site" => params[:id], "startDT" => params[:startDate], "endDT" => params[:endDate]}

    begin
      validate_datetime_params
      streamflow = StreamflowFromUSGS.new(search_params).streamflow
    rescue InvalidParameterError => e
      response = {}
      response[:errors] = e.api_error_messages

      return render :json => response, :status => 400
    end

    render json: streamflow
  end

  def download
    search_params = {"site" => params[:id], "startDT" => params[:startDate], "endDT" => params[:endDate] }

    begin
      validate_datetime_params
      streamflow = StreamflowFromUSGS.new(search_params).streamflow
    rescue InvalidParameterError => e
      response = {}
      response[:errors] = e.api_error_messages

      return render :json => response, :status => 400
    end

    if streamflow.discharge.length == 0
      return render :json => {}, :status => 204
    end

    respond_to do |format|
      format.csv { send_data(streamflow.as_csv, :type => 'text/csv') }
    end
  end

  private

  def date_range_streamflow_params
    params.permit(:start_date, :end_date)
  end

  def validate_datetime_params
    if params[:startDate].match(/^\d{4}-\d{2}-\d{2}$/).nil? || params[:endDate].match(/^\d{4}-\d{2}-\d{2}$/).nil?
      raise InvalidParameterError.new("Start and End Date must be in format 'YYYY-MM-DD'")
    end
  end

end
