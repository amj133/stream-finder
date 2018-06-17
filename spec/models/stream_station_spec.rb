require 'rails_helper'

describe StreamStation do
  describe "validations" do
    it { should validate_presence_of(:org_id) }
    it { should validate_presence_of(:type_of) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
  end

  describe "relationships" do
    it { should have_many(:stream_station_projects) }
    it { should have_many(:projects).through(:stream_station_projects) }
  end

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

    context "#by_org_id" do
      it "returns stream station by id" do
        create(:stream_station, org_id: "USGS-1", huc: "1")
        create(:stream_station, org_id: "USGS-2", huc: "2")
        create(:stream_station, org_id: "USGS-3", huc: "1")

        station = StreamStation.by_id("USGS-2")

        expect(station.org_id).to eq("USGS-2")
      end
    end

    context "#by_type" do
      it "returns collection by type" do
        create(:stream_station, org_id: "USGS-1", type_of: "Stream")
        create(:stream_station, org_id: "USGS-2", type_of: "Well")
        create(:stream_station, org_id: "USGS-3", type_of: "Stream")

        stations = StreamStation.by_type("Stream")

        expect(stations[0].org_id).to eq("USGS-1")
        expect(stations[1].org_id).to eq("USGS-3")
      end
    end

    context "#by_multiple_params" do
      it "returns collection by search params" do
        create(:stream_station, org_id: "USGS-1", huc: "1", type_of: "Stream", drainage_area: 1)
        create(:stream_station, org_id: "USGS-2", huc: "2", type_of: "Well", drainage_area: 2)
        create(:stream_station, org_id: "USGS-3", huc: "1", type_of: "Stream", drainage_area: 3)
        create(:stream_station, org_id: "USGS-4", huc: "3", type_of: "Stream", drainage_area: 4)

        stations = StreamStation.by_multiple_params({"huc" => "1", "siteType" => "Stream"})

        expect(stations[0].org_id).to eq("USGS-1")
        expect(stations[1].org_id).to eq("USGS-3")

        stations = StreamStation.by_multiple_params({"huc" => "1", "siteType" => "Well"})

        expect(stations[0]).to eq(nil)

        stations = StreamStation.by_multiple_params({"drainage_area" => "3-4"})

        expect(stations[0].org_id).to eq("USGS-3")
        expect(stations[1].org_id).to eq("USGS-4")

        stations = StreamStation.by_multiple_params({"huc" => "1", "drainage_area" => "3-4"})

        expect(stations.length).to eq(1)
        expect(stations[0].org_id).to eq("USGS-3")
      end

      it "returns collection by search params, huc only" do
        create(:stream_station, org_id: "USGS-1", huc: "1")
        create(:stream_station, org_id: "USGS-2", huc: "2")
        create(:stream_station, org_id: "USGS-3", huc: "1")

        stations = StreamStation.by_multiple_params({"huc" => "1"})

        expect(stations[0].org_id).to eq("USGS-1")
        expect(stations[1].org_id).to eq("USGS-3")

        stations = StreamStation.by_multiple_params({"huc" => "2"})

        expect(stations[0].org_id).to eq("USGS-2")
      end

      it "returns collection by search params, type only" do
        create(:stream_station, org_id: "USGS-1", type_of: "Stream")
        create(:stream_station, org_id: "USGS-2", type_of: "Well")
        create(:stream_station, org_id: "USGS-3", type_of: "Stream")

        stations = StreamStation.by_multiple_params({"siteType" => "Stream"})

        expect(stations[0].org_id).to eq("USGS-1")
        expect(stations[1].org_id).to eq("USGS-3")

        stations = StreamStation.by_multiple_params({"siteType" => "Well"})

        expect(stations[0].org_id).to eq("USGS-2")
      end
    end
  end
end
