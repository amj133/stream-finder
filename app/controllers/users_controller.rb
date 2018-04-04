class UsersController < ApplicationController
  before_action :require_current_user, only: [:show]

  def show
    @user = User.find_by_slug(params[:slug])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if password_confirmed? && @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.slug)
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :slug, :email, :password, :password_confirmation)
    end

    def password_confirmed?
      params[:user][:password] == params[:user][:password_confirmation]
    end

    def require_current_user
      render file: "/public/404" unless current_user
    end

end
