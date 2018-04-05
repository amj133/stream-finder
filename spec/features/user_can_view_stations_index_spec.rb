require 'rails_helper'

def stations_stub
  repo_uri = "data/Station/search?huc=14050003"
  get_WQP_stub("little_snake_stations", repo_uri)
end

def get_WQP_stub(filename, uri, headers = {})
  xml_response = File.open("./spec/fixtures/#{filename}.xml")
  stub_request(:get, "https://www.waterqualitydata.us/#{uri}")
    .to_return(status: 200, body: xml_response, headers: headers)
end

feature "user can view stations spec" do
  context "user visits /stations and selects a huc" do
    it "displays stations for given huc" do
      user = create(:user)

      stations_stub

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit stations_path
      select('14050003 Little Snake', :from => "huc_code")
      click_button('Find Stations')

      expect(current_path).to eq("/stations")
      expect(page).to have_content("14 Results")
      expect(page).to have_css(".station", count: 14)
      within(first(".station")) do
        expect(page).to have_css(".station-id")
        expect(page).to have_content("USGS-09251500")
        expect(page).to have_css(".station-name")
        expect(page).to have_content("MF LITTLE SNAKE RIVER NEAR BATTLE CREEK, CO.")
      end
    end
  end
end
