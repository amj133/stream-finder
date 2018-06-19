require 'rails_helper'

describe AppCredential do
  describe "relationships" do
    it { should belong_to(:user) }
  end
end
