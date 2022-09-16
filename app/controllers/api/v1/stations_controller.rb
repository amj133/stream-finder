class Api::V1::StationsController < ApplicationController

  def index
    begin
      stations = StationsPresenter.new(station_params).stations_by_multiple_params
    rescue InvalidParameterError => e
      response = {}
      response[:errors] = e.api_error_messages

      return render :json => response, :status => 400
    end

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
      params.permit(:huc, :siteType, :countycode, :siteid, :drainageArea)
    end

end
