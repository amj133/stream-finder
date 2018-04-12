require 'rails_helper'

describe StreamflowFromUSGS do
  describe "instance methods" do
    context "#streamflow" do
      it "returns Timeseries object" do
        usgs_01646500_streamflow_stub

        time_series = StreamflowFromUSGS.new({"site" => "01646500"}).streamflow

        expect(time_series).to be_a(TimeSeries)

        expect(time_series.time).to be_a(Array)
        expect(time_series.time.first).to eq("2018-04-11T16:30:00.000-05:00")
        expect(time_series.time.last).to eq("2018-04-12T15:45:00.000-05:00")

        expect(time_series.discharge).to be_a(Array)
        expect(time_series.discharge.first).to eq(10)
        expect(time_series.discharge.last).to eq(264)
      end
    end
  end
end
