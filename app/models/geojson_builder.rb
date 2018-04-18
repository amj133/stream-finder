class GeojsonBuilder

  def self.build_station(station)
    {
      "type" => "Feature",
      "geometry" => {
        "type" => "Point",
        "coordinates" => [station.longitude.to_f, station.latitude.to_f]
      },
      "properties" => {
        "id" => station.org_id,
        "name" => station.name,
        "type" => station.type_of, 
        "drainage_area" => station.drainage_area.to_i,
        "drainage_area_units" => station.drainage_area_units,
        "marker-color" => "#FFFFFF",
        "marker-symbol" => "circle",
        "marker-size" => "medium",
      }
    }
  end

end
