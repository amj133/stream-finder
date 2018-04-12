require "rails_helper"

describe StationsFromWQP do
  context "instance methods" do
    describe "#stations" do
      it "returns a collection of stations from multiple organizations" do
        stations_from_multiple_organizations_stub

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

      it "returns a single station from a single organization" do
        one_station_from_single_organization_stub

        params = { "siteid" => "USGS-09251500" }

        station = StationsFromWQP.new(params).stations

        expect(station).to be_a(Station)
        expect(station.id).to eq("USGS-09251500")
        expect(station.name).to eq("MF LITTLE SNAKE RIVER NEAR BATTLE CREEK, CO.")
        expect(station.drainage_area).to eq("120")
        expect(station.drainage_area_units).to eq("sq mi")
      end

      it "returns a collection of stations from a single organization" do
        stations_from_single_organization_stub

        stations = StationsFromWQP.new("huc" => "10190017").stations

        expect(stations.count).to eq(10)
        expect(stations.first).to be_a(Station)
        expect(stations.first.id).to eq("USGS-405432103591401")
        expect(stations.last.id).to eq("USGS-410004103545601")
      end
    end
  end
end
