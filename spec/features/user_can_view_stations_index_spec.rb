require 'rails_helper'

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
      expect(page).to have_content("433 stations")
      expect(page).to have_css(".station-index-table-rows", count: 433)
      within(first(".station-index-table-rows")) do
        expect(page).to have_content("USGS-09251500")
        expect(page).to have_content("MF LITTLE SNAKE RIVER NEAR BATTLE CREEK, CO.")
      end
    end
  end
end
