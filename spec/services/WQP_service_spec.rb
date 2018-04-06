require 'rails_helper'

describe WQPService do
  context "WQP request contains one organizations stations (hash format)" do
    it "has a collection of raw_station data" do
      VCR.use_cassette("WQP service station by huc search single org") do
        params = {"huc_code" => "10190017"}
        search = WQPService.new(params).station_by_huc

        expect(search).to have_key("WQX")
        expect(search["WQX"]).to be_a(Hash)

        expect(search["WQX"]).to have_key("Organization")
        expect(search["WQX"]["Organization"]).to be_a(Array)

        expect(search["WQX"]["Organization"][0]).to have_key("MonitoringLocation")
        expect(search["WQX"]["Organization"][0]["MonitoringLocation"]).to be_a(Array)

        raw_station = search["WQX"]["Organization"][0]["MonitoringLocation"].first

        expect(raw_station).to be_a(Hash)
        expect(raw_station).to have_key("MonitoringLocationIdentity")
        expect(raw_station["MonitoringLocationIdentity"]).to be_a(Hash)

        expect(raw_station["MonitoringLocationIdentity"]).to have_key("MonitoringLocationName")
        expect(raw_station["MonitoringLocationIdentity"]["MonitoringLocationName"]).to be_a(String)
      end
    end
  end

  context "WQP request contains multiple organizations' stations (array format)" do
    it "has a collection of raw_station data" do
      VCR.use_cassette("WQP service station by huc search many orgs") do
        params = {"huc_code" => "13010002"}
        search = WQPService.new(params).station_by_huc

        expect(search).to have_key("WQX")
        expect(search["WQX"]).to be_a(Hash)

        expect(search["WQX"]).to have_key("Organization")
        expect(search["WQX"]["Organization"]).to be_a(Array)

        expect(search["WQX"]["Organization"][0]).to have_key("MonitoringLocation")
        expect(search["WQX"]["Organization"][0]["MonitoringLocation"]).to be_a(Array)

        raw_station = search["WQX"]["Organization"][0]["MonitoringLocation"].first

        expect(raw_station).to be_a(Hash)
        expect(raw_station).to have_key("MonitoringLocationIdentity")
        expect(raw_station["MonitoringLocationIdentity"]).to be_a(Hash)

        expect(raw_station["MonitoringLocationIdentity"]).to have_key("MonitoringLocationName")
        expect(raw_station["MonitoringLocationIdentity"]["MonitoringLocationName"]).to be_a(String)
      end
    end
  end
end
