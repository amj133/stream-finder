class UsersController < ApplicationController

  def show
    @user = User.find_by_slug(params[:slug])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.slug)
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :slug, :email, :password, :password_confirmation)
    end

end
