class UsersController < ApplicationController
  before_action :require_current_user, only: [:show]

  def show
    @user = User.find_by_slug(params[:slug])
    return render :show  if @user == current_user

    flash[:notice] = "Cannot access"
    redirect_to user_path(current_user.slug)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(email: user_params[:email], first_name: user_params[:first_name], last_name: user_params[:last_name])
    if password_confirmed? && @user.save
      app_credential = AppCredential.create(password: user_params[:password])
      @user.app_credential = app_credential
      session[:user_id] = @user.id
      redirect_to user_path(@user.slug)
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
    end

    def password_confirmed?
      params[:user][:password] == params[:user][:password_confirmation]
    end

end
