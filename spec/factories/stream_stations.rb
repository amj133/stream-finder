FactoryBot.define do
  factory :stream_station do
    org_id "USGS-12345"
    name "Bear Run"
    huc "098765"
    type_of "Stream"
    latitude "1.234567"
    longitude "2.12345"
    drainage_area "1.2"
    drainage_area_units "sq mi"
  end
end
