require 'rails_helper'

feature "visitor can register" do
  context "visitor visits root" do
    describe "clicks on sign up" do
      it "fills out info, clicks sign up, and is brough to dashboard" do
        visit root_path

        click_on("Sign up!")

        expect(current_path).to eq("/register")

        fill_in("Name", with: "Billy")
        fill_in("Email", with: "Billy@example.com")
        fill_in("Password", with: "password")
        fill_in("Password_confirmation", with: "password")
        click_on("Sign up")

        expect(current_path).to eq("/users/billy")
        expect(page).to have_content("Welcome to StreamFinder Billy!")
      end
    end
  end
end
