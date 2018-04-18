class ProjectsController < ApplicationController
  before_action :require_current_user
  before_action :require_users_project, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def show
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

  def edit
  end

  def update
    @project.update(project_params)

    redirect_to user_path(current_user.slug)
  end

  def destroy
    @project.destroy

    redirect_to user_path(current_user.slug)
  end

  private
    def project_params
      params.require(:project).permit(:name, :huc)
    end

    def set_project
      @project = Project.find_by_slug(params[:slug])
    end

    def require_users_project
      render file: "/public/404" unless current_user.projects.find_by_slug(params[:slug])
    end

end
