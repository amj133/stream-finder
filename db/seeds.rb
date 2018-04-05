stations = CSV.open('/db/fixtures/stations_fixture.csv', headers: true, header_converters: :symbol)
stations.each do |row|
  Station.create!(
    organization: row[:organization],
    location_id: row[:location_id],
    location_name: row[:location_name],
    location_type: row[:location_type],
    huc_8: row[:huc_8],
    drainage_area_value: row[:drainage_area_value],
    drainage_area_unit_code: row[:drainage_area_unit_code],
    contributing_drainage_area_value: row[:contributing_drainage_area_value],
    latitude: row[:latitude],
    longitude: row[:longitude],
    horizontal_datum: row[:horizontal_datum],
    vertical_datum: row[:vertical_datum],
    state_code: row[:state_code],
    county_code: row[:county_code],
    aquifer_name: row[:aquifer_name],
    formation_type: row[:formation_type],
    aquifer_type: row[:aquifer_type],
    construction_date: row[:construction_date],
    well_depth_value: row[:well_depth_value],
    well_depth_unit_code: row[:well_depth_unit_code],
    provider: row[:provider]
  )
end
