require 'rails_helper'

describe FavoriteStationProject do
  describe "relationships" do
    it { should belong_to(:project) }
    it { should belong_to(:favorite_station) }
  end
end
