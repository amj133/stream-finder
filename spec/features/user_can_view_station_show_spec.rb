require 'rails_helper'

feature "user can view station information" do
  context "visits station index" do
    describe "filters by watershed, clicks id of station" do
      it "directed to stations/:station_id and displays information" do
        user = create(:user)

        station_by_id_stub
        stations_by_huc_stub

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit stations_path
        select('14050003 Little Snake', :from => "huc_code")
        click_button('Find Stations')
        click_on('USGS-09251500')

        expect(current_path).to eq('/stations/USGS-09251500')
        expect(page).to have_content("Station: USGS-09251500")
        expect(page).to have_content("Type: Stream")
        expect(page).to have_content("Description: ")
        expect(page).to have_content("Coordinates: 40.9905222, -107.0442186")
        expect(page).to have_content("Drainage Area: 120 sq mi.")
      end
    end
  end
end
