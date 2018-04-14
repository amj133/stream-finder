require 'rails_helper'

feature "user sees list of projects" do
  context "visits their dashboard" do
    it "display list of existing projects" do
      user = create(:user)
      user_projects = create_list(:projects, 2)

      visit user_path(user)

      expect(page).to have_content("Current Projects")
      expect(page).to have_link("Project 1")
      expect(page).to have_link("Project 2")
      expect(page).to have_link("Project 3")
    end
  end
end
#
#
#
# Scenario: User visits their dashboard page
# Then clicks create Project
# And is redirected to /projects/new
# Then fills in name and watershed for their project
# And clicks create project
# Then is brought to the new project show page
