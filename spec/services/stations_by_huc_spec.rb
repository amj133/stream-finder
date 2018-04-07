require 'rails_helper'

describe StationsByHUC do
  describe "instance methods" do
    context "#stations" do
      it "returns array of stations" do
        search = StationsByHUC.new("14050003")

        stations_stub

        expect(search.stations.count).to eq(433)
        expect(search.stations.first).to be_a(Station)
        expect(search.stations.first.id).to eq("USGS-09251500")
      end
    end
  end
end
