require 'rails_helper'

describe GoogleCredential do
  describe "relationships" do
    it { should belong_to(:user) }
  end
end
