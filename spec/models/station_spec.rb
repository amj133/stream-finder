require 'rails_helper'

describe Station do
  let(:attrs) {
    {
      "MonitoringLocationIdentity"=>
        {"MonitoringLocationIdentifier"=>"11NPSWRD-GRSA_NURE_0145",
         "MonitoringLocationName"=>"C29663",
         "MonitoringLocationTypeName"=>"River/Stream",
         "MonitoringLocationDescriptionText"=>"The station is located...",
         "DrainageAreaMeasure"=>
           {"MeasureValue"=>"120", "MeasureUnitCode"=>"sq mi"}},
      "MonitoringLocationGeospatial"=>
        {"LatitudeMeasure"=>"37.5636",
         "LongitudeMeasure"=>"-105.4392"}
    }
  }
  subject { Station.new(attrs) }

  it "sets attributes as reader methods" do
    expect(subject.id).to eq("11NPSWRD-GRSA_NURE_0145")
    expect(subject.name).to eq("C29663")
    expect(subject.type).to eq("River/Stream")
    expect(subject.description).to eq("The station is located...")
    expect(subject.latitude).to eq("37.5636")
    expect(subject.longitude).to eq("-105.4392")
    expect(subject.drainage_area).to eq("120")
    expect(subject.drainage_area_units).to eq("sq mi")
  end
end
