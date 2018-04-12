require "rails_helper"

describe StationsFromWQP do
  context "instance methods" do
    describe "#stations" do
      it "returns a collection of stations" do
        stations_by_many_params_stub

        params = {
          "huc" => "14080201",
          "statecode" => "US:08",
          "siteType" => "Stream"
        }
        stations = StationsFromWQP.new(params).stations

        expect(stations.first).to be_a(Station)
        expect(stations.last).to be_a(Station)

        expect(stations.first.id).to eq("USGS-09371010")
        expect(stations.last.id).to eq("UTEMTN-SJ-4C")
      end

      it "returns a single station" do
        station_by_id_stub

        params = { "siteid" => "USGS-09251500" }

        station = StationsFromWQP.new(params).stations

        expect(station).to be_a(Station)
        expect(station.id).to eq("USGS-09251500")
        expect(station.longitude).to eq("-107.0442186")
      end
    end
  end
end
