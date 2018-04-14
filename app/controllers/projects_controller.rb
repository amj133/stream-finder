class ProjectsController < ApplicationController
  before_action :require_current_user

  def show
    binding.pry
    @project = Project.find_by_slug(params[:slug])
  end

  private

  def require_current_user
    render file: "/public/404" unless current_user
  end

  def require_users_project
    render file: "/public/404" unless current_user.projects.find_by_slug(params[:slug])
  end

end
