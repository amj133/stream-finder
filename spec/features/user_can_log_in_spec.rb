require 'rails_helper'

feature "user can log in" do
  context "visits root" do
    describe "clicks on sign in" do
      let(:user) { create(:user) }

      it "fills out information, clicks sign in, brought to their dashboard" do
        user

        visit "/"
        click_on("Sign in")

        expect(current_path).to eq("/login")

        fill_in("email", with: "billy@example.com")
        fill_in("password", with: "password")
        click_on("Sign in")

        expect(current_path).to eq("/users/billy")
      end

      it "cannot log in with incorrect email" do
        user

        visit "/"
        click_on("Sign in")

        expect(current_path).to eq("/login")

        fill_in("email", with: "Billy123@example.com")
        fill_in("password", with: "password")
        click_on("Sign in")

        expect(current_path).to_not eq("/users/billy")
        expect(current_path).to eq("/login")
      end

      it "cannot log in with incorrect password" do
        user

        visit "/"
        click_on("Sign in")

        expect(current_path).to eq("/login")

        fill_in("email", with: "billy@example.com")
        fill_in("password", with: "wrong")
        click_on("Sign in")

        expect(current_path).to_not eq("/users/billy")
        expect(current_path).to eq("/login")
      end
    end
  end

  context "user can logout" do
    it "allows signed in user to logout" do
      create(:user)

      visit "/"
      click_on("Sign in")

      expect(current_path).to eq("/login")

      fill_in("email", with: "billy@example.com")
      fill_in("password", with: "password")
      click_on("Sign in")

      click_on('logout')

      expect(current_path).to eq("/")

      visit "users/billy"

      expect(page).to have_content("doesn't exist")
    end
  end
end