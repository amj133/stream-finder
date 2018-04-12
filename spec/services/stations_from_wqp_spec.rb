require "rails_helper"

describe StationsFromWQP do
  context "instance methods" do
    describe "#stations" do
      it "returns a collection of stations" do
        params = {
          "huc" => "14080201",
          "statecode" => "US:08",
          "siteType" => "Stream"
        }
        stations = StationsFromWQP.new(params).stations

        expect(stations.first).to be_a(Station)
        expect(stations.last).to be_a(Station)

        expect(stations.first).to eq(5)
      end
    end
  end
end
