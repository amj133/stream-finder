module StationToFavoriteStation

  def add_to_favorite_stations(station)
    FavoriteStation.new({
      org_id: station.org_id,
      type_of: station.type_of,
      description: station.description,
      latitude: station.latitude,
      longitude: station.longitude,
      drainage_area: station.drainage_area,
      drainage_area_units: station.drainage_area_units
    })
  end

end
