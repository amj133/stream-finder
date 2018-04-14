require 'rails_helper'

feature "user sees list of projects" do
  context "visits their dashboard" do
    it "display list of existing projects" do
      user = create(:user)
      project = create(:project, user: user)

      visit user_path(user)

      expect(page).to have_content("Current Projects")
      expect(page).to have_link("Project 1")
      expect(page).to have_link("Project 2")
      expect(page).to have_link("Project 3")
    end
  end
end
