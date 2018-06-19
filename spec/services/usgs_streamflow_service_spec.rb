require 'rails_helper'

describe USGSStreamflowService do
  describe "instance methods" do
    context "#raw_streamflow" do
      it "returns a raw collection of times and streamflow" do
        VCR.use_cassette("USGS Streamflow by Station") do
          search_params = {"period" => "P1D", "site" => "01646500"}
          raw_streamflow = USGSStreamflowService.new(search_params).raw_streamflow

          expect(raw_streamflow).to be_a(Hash)
          expect(raw_streamflow["value"]["timeSeries"]).to be_a(Array)

          raw_time_series = raw_streamflow["value"]["timeSeries"][1]["values"][0]["value"]

          expect(raw_time_series).to be_a(Array)
          expect(raw_time_series.first).to be_a(Hash)

          expect(raw_time_series.first["value"]).to be_a(String)
          expect(raw_time_series.first["dateTime"]).to be_a(String)
        end
      end
    end
  end
end
