class Api::V1::ProjectsController < ApplicationController

  def create
    project = current_user.projects.find_by_name(params[:project])
    params[:fav_stations].each do |station|
      search_params = {"siteid" => station}
      project.favorite_stations.push(StationsFromWQP.new(search_params).favorite_station)
    end
  end

  # private
  #   def get_station(fav_stations)
  #     fav_stations.map do |station|
  #       search_params = {"siteid" => station}
  #       StationsFromWQP.new(search_params).stations
  #     end
  #   end

end
