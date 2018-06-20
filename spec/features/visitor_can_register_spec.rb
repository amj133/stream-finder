require 'rails_helper'

feature "visitor can register" do
  context "visitor visits root" do
    describe "clicks on sign up" do
      it "fills out info, clicks sign up, and is brough to dashboard" do
        visit root_path

        click_on("Register")

        expect(current_path).to eq("/register")

        fill_in(id: "user_first_name", with: "Billy")
        fill_in(id: "user_email", with: "Billy@example.com")
        fill_in(id: "user_password", with: "password")
        fill_in(id: "user_password_confirmation", with: "password")
        click_on("Sign up")

        expect(current_path).to eq("/users/billy")
        expect(page).to have_content("Welcome to StreamFinder Billy")
       end

      it "does not register without valid password confirmation" do
        visit root_path

        click_on("Register")

        expect(current_path).to eq("/register")

        fill_in(id: "user_first_name", with: "Billy")
        fill_in(id: "user_email", with: "Billy@example.com")
        fill_in(id: "user_password", with: "password")
        fill_in(id: "user_password_confirmation", with: "wrong")
        click_on("Sign up")

        expect(current_path).to_not eq("/users/billy")
        expect(current_path).to eq("/users")
        expect(User.count).to eq(0)
      end

      it "does not register if email is taken" do
        create(:user)
        visit root_path

        click_on("Register")

        expect(current_path).to eq("/register")

        fill_in(id: "user_first_name", with: "Billy123")
        fill_in(id: "user_email", with: "billy@example.com")
        fill_in(id: "user_password", with: "password")
        fill_in(id: "user_password_confirmation", with: "password")
        click_on("Sign up")

        expect(current_path).to_not eq("/users/billy")
        expect(current_path).to eq("/users")
        expect(User.count).to eq(1)
      end
    end
  end
end
