require 'rails_helper'

describe StreamStationProject do
  describe "relationships" do
    it { should belong_to(:stream_station) }
    it { should belong_to(:project) }
  end
end
