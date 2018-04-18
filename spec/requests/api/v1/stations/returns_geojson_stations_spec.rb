require 'rails_helper'

describe "GET /api/v1/stations" do
  it "returns collect of geojson stations" do
    station_1 = create(:stream_station, org_id: "USGS-1")
    station_2 = create(:stream_station, org_id: "USGS-2")

    params = { "huc" => "098765" }
    get "/api/v1/stations", params: params

    expect(response).to be_success

    stations = JSON.parse(response.body)

    expect(stations[0]).to be_a(Hash)
    expect(stations[0]).to have_key("properties")
    expect(stations[0]["properties"]["id"]).to eq("USGS-1")
    expect(stations[1]["properties"]["id"]).to eq("USGS-2")
  end
end
