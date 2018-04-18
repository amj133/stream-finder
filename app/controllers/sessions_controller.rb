class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if request.env["omniauth.auth"]
      user = User.create_or_update(request.env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to user_path(user.slug)
    elsif user && user.password_digest.nil?
      flash[:notice] = "Must login through Google!"
      render :new
    elsif user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.slug)
    else
      flash[:notice] = "Incorrect credentials"
      render :new
    end
  end

  def delete
    session.destroy
    redirect_to root_path
  end

end
