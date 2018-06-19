class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if request.env["omniauth.auth"]
      user = User.create_or_update(request.env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to user_path(user.slug)
    elsif user && user.app_credential.nil?
      flash[:notice] = "Must login through Google!"
      redirect_to login_path
    elsif user && user.app_credential.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.slug)
    else
      flash[:notice] = "Incorrect credentials"
      redirect_to login_path
    end
  end

  def delete
    session.destroy
    redirect_to root_path
  end

end
