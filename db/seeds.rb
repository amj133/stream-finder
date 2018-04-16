hucs = [
  "10190001",
  "10190002",
  "10190003",
  "10190004",
  "10190005",
  "10190006",
  "10190007",
  "10190008",
  "10190010",
  "10190014",
  "11020001",
  "11020002",
  "11020003",
  "11020004",
  "11020005",
  "11020008",
  "14010001",
  "14010002",
  "14010003"
]

desc "Loading all stations along urban front range"
  task load_urban_stations: :environment do
    MonitoringStation.destroy_all
    puts 'Loading urban stations'

    hucs.each do |huc|
      stations = StationsFromWQP.new({"huc" => huc})
      stations.each do |station|
        MonitoringStation.create!(
          org_id: station.id,
          name: station.name,
          type_of: station.type,
          description: station.description,
          latitude: station.latitude,
          longitude: station.longitude,
          drainage_area: station.drainage_area,
          drainage_area_units: station.drainage_area_units
        )
      end
    end

    puts "All urban stations loaded\n"
  end
