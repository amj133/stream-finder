FactoryBot.define do
  factory :favorite_station do
    sequence(:org_id) { |n| "USGS-#{n}" }
    type "Stream"
    description "Located near rt. 70..."
    sequence(:latitude) { |n| 59.12345678 + n }
    sequence(:longitude) { |n| -111.12345678 + n }
    sequence(:drainage_area) { |n| n }
    drainage_area_units "sq mi"
  end
end
