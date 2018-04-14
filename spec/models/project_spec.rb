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
  end
end
