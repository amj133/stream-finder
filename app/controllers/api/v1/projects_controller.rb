class Api::V1::ProjectsController < ApplicationController

  def create
    project = current_user.projects.find_by_name(params[:project])
    params[:fav_stations].each do |station|
      search_params = {siteid: station}

      # station = StationsPresenter.new(search_params).stations_by_id
      binding.pry
      project.favorite_stations.push(get_station(search_params))
      # project.favorite_stations.push(StationsFromWQP.new(search_params).favorite_station)
    end
  end

  private

    def get_station(search_params)
      StationsPresenter.new(search_params).station_by_id
    end

end
