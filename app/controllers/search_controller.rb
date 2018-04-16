class SearchController < ApplicationController
  before_action :require_current_user

  def index
    @projects = current_user.projects.to_json
  end

  private
    def require_current_user
      render file: "/public/404" unless current_user
    end

end
