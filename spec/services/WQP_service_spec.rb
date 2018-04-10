require 'rails_helper'

describe WQPService do
  describe "instance methods" do
    describe "#stations_by_huc" do
      it "has a collection of raw_station data" do
        VCR.use_cassette("WQP service station by huc search") do
          params = {"huc_code" => "10190017"}
          search = WQPService.new(params).stations_by_huc

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

    describe "#station_by_id" do
      it "returns a single raw station" do
        VCR.use_cassette("WQP service station by id search") do
          params = {"station_id" => "USGS-09251500"}
          raw_station = WQPService.new(params).station_by_id

          expect(raw_station).to have_key("WQX")
          expect(raw_station["WQX"]).to be_a(Hash)

          expect(raw_station["WQX"]["Organization"]).to be_a(Hash)

          expect(raw_station["WQX"]["Organization"]["OrganizationDescription"]["OrganizationFormalName"]).to be_a(String)

          expect(raw_station["WQX"]["Organization"]["MonitoringLocation"]).to be_a(Hash)
          expect(raw_station["WQX"]["Organization"]["MonitoringLocation"]).to be_a(Hash)
          expect(raw_station["WQX"]["Organization"]["MonitoringLocation"]["MonitoringLocationIdentity"]).to be_a(Hash)
          expect(raw_station["WQX"]["Organization"]["MonitoringLocation"]["MonitoringLocationIdentity"]["MonitoringLocationIdentifier"]).to be_a(String)
          expect(raw_station["WQX"]["Organization"]["MonitoringLocation"]["MonitoringLocationIdentity"]["MonitoringLocationName"]).to be_a(String)
          expect(raw_station["WQX"]["Organization"]["MonitoringLocation"]["MonitoringLocationIdentity"]["MonitoringLocationTypeName"]).to be_a(String)
          expect(raw_station["WQX"]["Organization"]["MonitoringLocation"]["MonitoringLocationIdentity"]["HUCEightDigitCode"]).to be_a(String)
          expect(raw_station["WQX"]["Organization"]["MonitoringLocation"]["MonitoringLocationIdentity"]["DrainageAreaMeasure"]).to be_a(Hash)
          expect(raw_station["WQX"]["Organization"]["MonitoringLocation"]["MonitoringLocationIdentity"]["DrainageAreaMeasure"]["MeasureValue"]).to be_a(String)
          expect(raw_station["WQX"]["Organization"]["MonitoringLocation"]["MonitoringLocationIdentity"]["DrainageAreaMeasure"]["MeasureUnitCode"]).to be_a(String)

          expect(raw_station["WQX"]["Organization"]["MonitoringLocation"]["MonitoringLocationGeospatial"]).to be_a(Hash)
          expect(raw_station["WQX"]["Organization"]["MonitoringLocation"]["MonitoringLocationGeospatial"]["LatitudeMeasure"]).to be_a(String)
          expect(raw_station["WQX"]["Organization"]["MonitoringLocation"]["MonitoringLocationGeospatial"]["LongitudeMeasure"]).to be_a(String)
        end
      end
    end
  end
end
