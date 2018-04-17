require 'rails_helper'

describe Project do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:huc) }
  end

  describe "uniqueness" do
    it { should validate_uniqueness_of(:name) }
  end

  describe "relationships" do
    it { should belong_to(:user) }
    it { should have_many(:favorite_station_projects) }
    it { should have_many(:favorite_stations).through(:favorite_station_projects) }
    it { should have_many(:stream_station_projects) }
    it { should have_many(:stream_stations).through(:stream_station_projects) }
  end
end
