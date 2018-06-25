require 'rails_helper'

describe "GET /api/v1/recent_streamflow" do
  it "returns time and 24hr streamflow for station" do
    VCR.use_cassette("USGS Streamflow by Station") do
      params = { station_id: "01646500" }
      get "/api/v1/recent_streamflow", params: params

      expect(response).to be_success

      time_series = JSON.parse(response.body)

      x_axis_data = time_series["time"]
      y_axis_data = time_series["discharge"]

      expect(x_axis_data.first.split[0]).to eq("2018")
      expect(x_axis_data.last.split[0]).to eq("2018")

      expect(y_axis_data.first.class).to eq(Float)
      expect(y_axis_data.last.class).to eq(Float)
    end
  end
end
