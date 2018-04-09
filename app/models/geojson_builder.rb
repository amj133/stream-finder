class GeojsonBuilder

  def self.build_stations(station)
    {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [station.longitude, station.latitude] # this part is tricky
      },
      properties: {
        name: station.name,
        type: station.type,
        drainage_area: station.drainage_area,
        drainage_area_units: station.drainage_area_units,
        :"marker-color" => "#FFFFFF",
        :"marker-symbol" => "circle",
        :"marker-size" => "medium",
      }
    }
  end

end
