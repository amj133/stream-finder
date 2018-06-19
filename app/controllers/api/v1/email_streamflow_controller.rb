class Api::V1::EmailStreamflowController < ApplicationController

  def show
    user = User.find(session[:user_id]).email
    search_params = {"site" => params[:id], "startDT" => params[:startDate], "endDT" => params[:endDate]}
    streamflow = StreamflowFromUSGS.new(search_params).streamflow

    StreamflowMailer.historical_streamflow(user, streamflow).deliver_now
  end

end
