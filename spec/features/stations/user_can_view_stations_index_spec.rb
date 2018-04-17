require 'rails_helper'

feature "user can view stations spec" do
  context "user visits /stations and selects a huc" do
    it "displays stations for given huc" do
      user = create(:user)

      stations_from_single_organization_stub

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit stations_path
      select('10190017 Sidney Draw', :from => "huc_code")
      click_button('Find Stations')

      expect(current_path).to eq("/stations")
      expect(page).to have_content("10 stations")
      expect(page).to have_css(".station-index-table-rows", count: 10)
      within(first(".station-index-table-rows")) do
        expect(page).to have_content("USGS-405432103591401")
        expect(page).to have_content("40.9088743")
        expect(page).to have_content("-103.9877258")
      end
    end
  end
end
