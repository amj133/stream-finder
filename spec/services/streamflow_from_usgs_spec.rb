require 'rails_helper'

describe StreamflowFromUSGS do
  describe "instance methods" do
    context "#streamflow" do
      it "returns Timeseries object" do
        usgs_01646500_streamflow_stub

        time_series = StreamflowFromUSGS.new({"period" => "P1D", "site" => "01646500"}).streamflow

        expect(time_series).to be_a(TimeSeries)

        expect(time_series.time).to be_a(Array)
        expect(time_series.time.first).to be_a(DateTime)
        expect(time_series.time.last).to be_a(DateTime)

        expect(time_series.discharge).to be_a(Array)
        expect(time_series.discharge.first).to eq(10.3)
        expect(time_series.discharge.last).to eq(11.8)
      end
    end
  end
end
