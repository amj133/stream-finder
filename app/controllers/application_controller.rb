class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include COWatersheds

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_current_user
    render file: "/public/404" unless current_user
  end
end
