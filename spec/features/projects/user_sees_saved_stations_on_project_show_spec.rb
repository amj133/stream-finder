require 'rails_helper'

describe "user visits project show page" do
  it "displays list of saved stations" do
    user = create(:user)
    project = create(:project, user: user)
    station_1 = create(:favorite_station, org_id: "USGS-405432103591401")
    station_2 = create(:favorite_station)
    FavoriteStationProject.create(project: project, favorite_station: station_1)
    FavoriteStationProject.create(project: project, favorite_station: station_2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit project_path(project.slug)

    expect(current_path).to eq("/projects/#{project.slug}")
    expect(page).to have_content("Saved Monitoring Stations")
    expect(page).to have_link("USGS-405432103591401")
    expect(page).to have_link(station_2.org_id)

    usgs_405432103591401_station_stub

    click_on('USGS-405432103591401')

    expect(current_path).to eq('/stations/USGS-405432103591401')
  end
end
