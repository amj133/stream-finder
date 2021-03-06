require 'rails_helper'

describe "user can remove favorite stations" do
  context "visits project show page" do
    it "remove next to station" do
      user = create(:user)
      project = create(:project, user: user)
      station = create(:favorite_station)
      FavoriteStationProject.create(project: project, favorite_station: station)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit project_path(project)

      expect(page).to have_content(station.org_id)

      click_on("remove")

      expect(current_path).to eq("/projects/#{project.name.parameterize}")
      expect(page).to_not have_content(station.org_id)
      expect(project.favorite_stations.count).to eq(0)
      expect(FavoriteStation.count).to eq(1)
    end
  end
end
