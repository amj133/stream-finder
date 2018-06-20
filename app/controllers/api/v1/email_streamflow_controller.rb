class Api::V1::EmailStreamflowController < ApplicationController

  def show
    email = User.find(session[:user_id]).email
    search_params = {"site" => params[:id], "startDT" => params[:startDate], "endDT" => params[:endDate]}
    streamflow = StreamflowFromUSGS.new(search_params).streamflow
    time = streamflow.time.map(&:to_s)

    SendStreamflowEmailJob.perform_later(email, time, streamflow.discharge)
  end

end
