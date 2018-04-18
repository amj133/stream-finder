class SearchController < ApplicationController
  before_action :require_current_user

  def index
    @projects = current_user.projects.to_json
  end

end
