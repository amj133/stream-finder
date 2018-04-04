class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.slug)
    elsif request.env["omniauth.auth"]
      session[:user_id] = user.id
      User.create_or_update
      redirect_to user_path(user.slug)
    else
      flash[:notice] = "Incorrect credentials"
      render :new
    end
  end

end
