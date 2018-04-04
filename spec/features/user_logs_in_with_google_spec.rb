require 'rails_helper'

def stub_omniauth
  OmniAuth.configure.test_mode = true
  OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({

    })
end

feature "user logs in with Google Oauth" do
  context "visits root" do
    it "clicks sign in with google" do
      visit root_path
      click_on("Sign in with Google")

      expect(current_path).to eq("/users/billy")
      expect(page).to have_content("Welcome to StreamFinder Billy")
    end
  end
end
