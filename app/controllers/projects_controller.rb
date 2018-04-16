class ProjectsController < ApplicationController
  before_action :require_current_user
  before_action :require_users_project, only: [:show]

  def show
    @project = Project.find_by_slug(params[:slug])
  end

  def new
    @project = Project.new
  end

  def create
    project = current_user.projects.new(project_params)
    if project.save!
      redirect_to user_path(current_user.slug)
    else
      render :new
    end
  end

  def destroy
    user = User.find_by_slug(params[:user])
    project = Project.find_by_slug(params[:slug])
    project.destroy

    redirect_to user_path(user.slug)
  end

  private
    def project_params
      params.require(:project).permit(:name, :huc)
    end

    def require_current_user
      render file: "/public/404" unless current_user
    end

    def require_users_project
      render file: "/public/404" unless current_user.projects.find_by_slug(params[:slug])
    end

end
