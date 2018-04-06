require 'rails_helper'

describe Station do
  let(:attrs) {
    {
      "MonitoringLocationIdentity"=>
        {"MonitoringLocationIdentifier"=>"USGS-09251500",
         "MonitoringLocationName"=>"MF LITTLE SNAKE RIVER NEAR BATTLE CREEK, CO.",
         "MonitoringLocationTypeName"=>"Stream",
         "MonitoringLocationDescriptionText"=>"Nice stream near a good wetland",
         "HUCEightDigitCode"=>"14050003",
         "DrainageAreaMeasure"=>{"MeasureValue"=>"120", "MeasureUnitCode"=>"sq mi"}},
       "MonitoringLocationGeospatial"=>
         {"LatitudeMeasure"=>"40.9905222", "LongitudeMeasure"=>"-107.0442186"}
        }
  }
  subject { Station.new(attrs) }

  it "exists" do
    expect(subject).to be_a(Station)
  end

  it "assings attributes to reader methods" do
    expect(subject.id).to eq("USGS-09251500")
    expect(subject.name).to eq("MF LITTLE SNAKE RIVER NEAR BATTLE CREEK, CO.")
    expect(subject.type).to eq("Stream")
    expect(subject.description).to eq("Nice stream near a good wetland")
    expect(subject.drainage_area).to eq("120")
    expect(subject.drainage_area_units).to eq("sq mi")
    expect(subject.latitude).to eq("40.9905222")
    expect(subject.longitude).to eq("-107.0442186")
  end
end
