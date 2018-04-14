require 'rails_helper'

describe "user visits project show page" do
  it "displays list of saved stations" do
    user = create(:user)
    project = create(:project, user: user)
    station_1 = create(:favorite_station, project: project)
    station_2 = create(:favorite_station, project: project)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:user)

    visit project_path(project)

    expect(current_path).to eq("projects/project-1")
    expect(page).to have_content("Saved Stations")
    expect(page).to have_link("Station-1")
    expect(page).to have_link("Station-2")
  end
end
