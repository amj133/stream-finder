require 'rails_helper'

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new(
    {
      "provider" => "google",
      "uid" => "12345",
      "info" => {"name"=>"Billy Bob",
                     "email"=>"billy@example.com",
                     "first_name"=>"Billy",
                     "last_name"=>"Bob",
                     "image"=>"https://lh3.googleusercontent.com/-WlovucTzrcg/AAAAAAAAAAI/AAAAAAAAAAA/b6cHrPLGZsM/s50-c/photo.jpg",
                     "urls"=>{"google"=>"https://plus.google.com/102753798395250312915"}},
      "credentials" => {"token"=>
                        "ya29.GluTBeTjXUBAVhdQvj_itydUpV1f9t-yZV0HuHV5Dx8hXq46CH6kIt-ULKlvCzJKEEECDdAKAv3kuRDepP--hCxjr_WbJG-kevtlvIR96yDHiZz3u7N4J-MT32QI",
                        "expires_at"=>1522848529,
                        "refresh_token"=>"abc123",
                        "expires"=>true}
    }
  )
end

feature "user logs in with Google Oauth" do
  context "visits root" do
    it "clicks sign in with google" do
      stub_omniauth

      visit root_path
      click_on(class: 'google')

      expect(current_path).to eq("/users/billy")
      expect(page).to have_content("Welcome to StreamFinder Billy")
      expect(page).to have_content("logout")
      expect(User.count).to eq(1)
    end
  end

  context "user changes info on google" do
    it "and user info is updated" do
      stub_omniauth

      create(:user, email: "monkeysRock@example.com")

      stub_omniauth
      visit root_path
      click_on(class: 'google')

      expect(User.last.email).to eq("billy@example.com")
      expect(User.last.slug).to eq("billy")
    end
  end
end
