require 'rails_helper'

describe GeojsonBuilder do
  describe "instance methods" do
    context "#build_station" do
      it "returns array of geojson formatted hashes" do
        stations = build_list(:station, 5)
        geojson = []
        stations.each do |station|
          geojson << GeojsonBuilder.build_stations(station)
        end

        expect(geojson.count).to eq(5)
        expect(geojson[0][:properties][:name]).to eq("C29663")
        expect(geojson[4][:properties][:drainage_area]).to eq("120")
      end
    end
  end
end
