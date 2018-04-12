class Api::V1::StationsController < ApplicationController

  def index
    stations = StationsFromWQP.new(station_params).stations
    geo_stations = transform_to_geojson(stations)
    render json: geo_stations
  end

  private
    def transform_to_geojson(stations)
      stations.map do |station|
        GeojsonBuilder.build_station(station)
      end
    end

    def station_params
      params.permit(:huc, :siteType, :countcode, :siteid)
    end

end
