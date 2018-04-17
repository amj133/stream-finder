class GeojsonBuilder

  def self.build_station(station)
    if station.class == Station
      station_id = station.id
      station_type = station.type
    elsif station.class == StreamStation
      station_id = station.org_id
      station_type = station.type_of
    end
    {
      "type" => "Feature",
      "geometry" => {
        "type" => "Point",
        "coordinates" => [station.longitude.to_f, station.latitude.to_f]
      },
      "properties" => {
        "id" => station_id, #station.id,
        "name" => station.name,
        "type" => station_type, #station.type,
        "drainage_area" => station.drainage_area.to_i,
        "drainage_area_units" => station.drainage_area_units,
        "marker-color" => "#FFFFFF",
        "marker-symbol" => "circle",
        "marker-size" => "medium",
      }
    }
  end

end
