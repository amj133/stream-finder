require 'rails_helper'

feature "user can delete project" do
  context "visits dashboard" do
    describe "clicks delete next to project" do
      it "reloads page with project gone" do
        user = create(:user)
        project = create(:project, user: user)
        station = create(:favorite_station)
        FavoriteStationProject.create(project: project, favorite_station: station)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit user_path(user.slug)

        expect(page).to have_content("Project 1")
        expect(project.favorite_stations.count).to eq(1)

        click_on("delete")

        # expect(page).to have_content("Delete project and all associated stations?")
        #
        # click_on("Ok")

        expect(current_path).to eq(user_path(user.slug))
        expect(page).to_not have_content("Project 1")
        expect(project.favorite_stations.count).to eq(0)
      end
    end
  end
end
