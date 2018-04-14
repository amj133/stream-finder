class Api::V1::StationsController < ApplicationController

  def index
    # ON demand cache (user driven)
    # could be a nightly job (backgroud worker)

    # cron job - call script to regularly populate dB
    # every night at midnight run this script
    # (aws - lambda)

    # get db instance thing
    # result = search.findBy(searchKey) check cache method
    # if result -> use from cache
    # else make API call and store in cache

    # line below gets replaced b/c pulled from cache
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
