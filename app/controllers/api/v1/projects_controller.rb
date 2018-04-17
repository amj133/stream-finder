class Api::V1::ProjectsController < ApplicationController

  def create
    project = current_user.projects.find_by_name(params[:project])
    stations_to_add = params[:fav_stations]
    add_stations(project, stations_to_add)
    # params[:fav_stations].each do |station|
    #   search_params = {siteid: station}
    #   project.favorite_stations.push(StationsFromWQP.new(search_params).favorite_station)
  end

  private

    def add_stations(project, stations_to_add)
      stations_to_add.each do |station|
        search_params = {siteid: station}
        project.favorite_stations.push(StationsFromWQP.new(search_params).favorite_station)
      end
    end

end
