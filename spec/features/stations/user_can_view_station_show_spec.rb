require 'rails_helper'

feature "user can view station information" do
  context "visits station index" do
    describe "filters by watershed, clicks id of station" do
      it "directed to stations/:station_id and displays information" do
        user = create(:user)

        stations_from_single_organization_stub
        usgs_405432103591401_station_stub

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit stations_path
        select('10190017 Sidney Draw', :from => "huc_code")
        click_button('Find Stations')
        click_on('USGS-405432103591401')

        expect(current_path).to eq('/stations/USGS-405432103591401')
        expect(page).to have_content("Station ID: USGS-405432103591401")
        expect(page).to have_content("Type: Well")
        expect(page).to have_content("Description: ")
        expect(page).to have_content("Coordinates: 40.9088743, -103.9877258")
        expect(page).to have_content("Drainage Area: .")
      end
    end
  end
end
