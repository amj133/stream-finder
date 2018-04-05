require 'rails_helper'

describe Station do
  describe "validations" do
    it { should validate_presence_of(:organization) }
    it { should validate_presence_of(:location_id) }
    it { should validate_presence_of(:huc_8) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:provider) }
  end
end
