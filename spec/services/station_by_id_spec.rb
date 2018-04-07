require 'rails_helper'

describe StationByID do
  describe "instance methods" do
    context "#station" do
      it "returns single station" do
        station_by_id_stub

        station = StationByID.new("USGS-09251500").station

        expect(station).to be_a(Station)
        expect(station.id).to eq("USGS-09251500")
        expect(station.name).to eq("MF LITTLE SNAKE RIVER NEAR BATTLE CREEK, CO.")
        expect(station.drainage_area).to eq("120")
        expect(station.drainage_area_units).to eq("sq mi")
      end
    end
  end
end
