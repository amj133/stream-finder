require 'rails_helper'

describe FavoriteStation do
  describe "validations" do
    it { should validate_presence_of(:org_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:type) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
  end

  describe "relationships" do
    it { should have_many(:projects) }
  end
end
