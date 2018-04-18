class StreamStationUpdateJob < ApplicationJob
  queue_as :default

  def perform
    hucs = ["10190001", "10190002", "10190003", "10190004", "10190005","10190006",
      "10190007", "10190008", "10190009", "10190010", "10190014", "11020001", "11020002",
      "11020003", "11020004", "11020005", "11020008", "14010001", "14010002", "14010003"]

    StreamStation.destroy_all

    hucs.each do |huc|
      search_params = { "huc" => huc, "siteType" => "Stream" }
      stations = StationsFromWQP.new(search_params).stations
      stations.each do |station|
        StreamStation.create!(
          org_id: station.org_id,
          name: station.name,
          type_of: station.type_of,
          huc: station.huc,
          description: station.description,
          latitude: station.latitude,
          longitude: station.longitude,
          drainage_area: station.drainage_area,
          drainage_area_units: station.drainage_area_units
        )
      end
    end
  end
end
