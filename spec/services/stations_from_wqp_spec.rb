require "rails_helper"

describe StationsFromWQP do
  context "instance methods" do
    describe "#stations" do
      it "returns a collection of stations from multiple search params" do
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
        expect(station.name).to eq("MF LITTLE SNAKE RIVER NEAR BATTLE CREEK, CO.")
        expect(station.drainage_area).to eq("120")
        expect(station.drainage_area_units).to eq("sq mi")
      end

      it "returns collection of stations from single search param" do
        stations_by_huc_stub

        stations = StationsFromWQP.new("huc" => "14050003").stations

        expect(stations.count).to eq(433)
        expect(stations.first).to be_a(Station)
        expect(stations.first.id).to eq("USGS-09251500")
        expect(stations.last.id).to eq("WYDEQ_WQX-WB14")
      end
    end
  end
end
