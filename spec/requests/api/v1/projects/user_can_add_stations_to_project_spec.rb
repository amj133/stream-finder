require 'rails_helper'

describe "POST /api/v1/projects" do
  it "adds stations to a project" do
    user = create(:user)
    project = create(:project, user: user)
    station_1 = create(:favorite_station, org_id: "USGS-405432103591401")
    station_2 = create(:favorite_station, org_id: "USGS-07079195")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    params = {
      "project" => "Project 1",
      "fav_stations" => [station_1.org_id] #, station_2.org_id]
    }

    usgs_405432103591401_station_stub

    post "/api/v1/projects", params: params

    expect(response).to be_success
    expect(project.favorite_stations.count).to eq(1)
    expect(project.favorite_stations[0].org_id).to eq("USGS-405432103591401")
    # expect(project.favorite_stations[1].org_id).to eq("USGS-07079195")
  end
end
