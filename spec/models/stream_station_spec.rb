require 'rails_helper'

describe StreamStation do
  describe "class methods" do
    context "#by_huc" do
      it "returns stream stations by huc" do
        create(:stream_station, org_id: "USGS-1", huc: "1")
        create(:stream_station, org_id: "USGS-2", huc: "2")
        create(:stream_station, org_id: "USGS-3", huc: "1")

        stations = StreamStation.by_huc("1")

        expect(stations.count).to eq(2)
        expect(stations[0].org_id).to eq("USGS-1")
        expect(stations[1].org_id).to eq("USGS-3")
      end
    end
  end
end
