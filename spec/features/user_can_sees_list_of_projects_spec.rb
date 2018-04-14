require 'rails_helper'

feature "user sees list of projects" do
  context "visits their dashboard" do
    it "display list of existing projects" do
      user = create(:user)
      project_1 = create(:project, user: user)
      project_2 = create(:project, user: user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user.slug)

      expect(page).to have_content("Current Projects")
      expect(page).to have_link("Project 1")
      expect(page).to have_content("Watershed HUC: 01234567")
      expect(page).to have_link("Project 2")
      expect(page).to have_content("Watershed HUC: 01234567")
    end
  end
end
