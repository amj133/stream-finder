require 'rails_helper'

describe "GET /api/v1/streamflow" do
  it "returns time and streamflow for station" do
    VCR.use_cassette("USGS Streamflow by Station") do
      params = { station_id: "01646500" }
      get "/api/v1/streamflow", params: params

      expect(response).to be_success

      time_series = JSON.parse(response.body)

      x_axis_data = time_series["time"]
      y_axis_data = time_series["discharge"]

      expect(x_axis_data.first).to eq("2018 04 11 18 45")
      expect(x_axis_data.last).to eq("2018 04 12 17 45")

      expect(y_axis_data.first).to eq(10.4)
      expect(y_axis_data.last).to eq(11.7)
    end
  end
end
