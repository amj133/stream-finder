require 'rails_helper'

describe "GET /api/v1/streamflow" do
  it "returns time and streamflow for station" do
    params = {
      station_id: "01646500",
      period: "P1D"
    }
    get "/api/v1/streamflow", params: params

    expect(response).to be_success

    streamflow_data = JSON.parse(response.body)
    x_axis_data = streamflow_data.time
    y_axis_data = streamflow_data.stream_flow

    expect(x_axis_data[0]).to eq("2018-04-11T15:30:00.000-05:00")
    expect(x_axis_data[1]).to eq("2018-04-11T16:15:00.000-05:00")

    expect(y_axis_data[0]).to eq(258)
    expect(y_axis_data[3]).to eq(257)
  end
end
