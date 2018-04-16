class FavoriteStationsController < ApplicationController

  def destroy
    project = Project.find_by_slug(params[:project])
    station = FavoriteStation.find(params[:id])
    project.favorite_stations.delete(station)

    redirect_to project_path(project.slug)
  end

end
