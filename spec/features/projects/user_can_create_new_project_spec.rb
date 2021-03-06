  require 'rails_helper'

  feature "user can create new project" do
    context "visits dashboard and clicks create new project" do
      it "fills out information and clicks create project" do
        user = create(:user)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit user_path(user.slug)
        click_on("Create New Project")

        expect(current_path).to eq("/projects/new")

        fill_in("Name", with: "Project-1")
        fill_in("Huc", with: "01234567")
        click_on("Create Project")

        expect(current_path).to eq(user_path(user.slug))
        expect(page).to have_link("Project-1")
        expect(user.projects.count).to eq(1)
        expect(user.projects.first.name).to eq("Project-1")
      end
    end
  end
