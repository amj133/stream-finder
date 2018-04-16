require 'rails_helper'

feature "user can edit project" do
  context "user visits project show page" do
    describe "clicks edit and is brought to edit page" do
      it "changes name, clicks edit project, brought to dashboard" do
        user = create(:user)
        project = create(:project, user: user)
        station = create(:favorite_station)
        FavoriteStationProject.create(project: project, favorite_station: station)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit project_path(project.slug)

        click_on("edit")

        expect(current_path).to eq("/projects/#{project.name.parameterize}/edit")

        fill_in("Name", with: "New Project Name")
        fill_in("Huc", with: "012345")
        click_on("Update Project")

        expect(current_path).to eq(user_path(user.slug))
        expect(page).to have_content("New Project Name")
        expect(page).to have_content("012345")
      end
    end
  end
end
