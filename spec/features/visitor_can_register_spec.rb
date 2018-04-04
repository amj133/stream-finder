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
        fill_in("Password confirmation", with: "password")
        click_on("Sign up")

        expect(current_path).to eq("/users/billy")
        expect(page).to have_content("Welcome to StreamFinder Billy")
       end

       it "does not register without valid password confirmation" do
         visit root_path

         click_on("Sign up!")

         expect(current_path).to eq("/register")

         fill_in("Name", with: "Billy")
         fill_in("Email", with: "Billy@example.com")
         fill_in("Password", with: "password")
         fill_in("Password confirmation", with: "wrong")
         click_on("Sign up")

         expect(current_path).to_not eq("/users/billy")
         expect(current_path).to eq("/users")
         expect(User.count).to eq(0)
       end

       it "does not register if name is taken" do
         create(:user)
         visit root_path

         click_on("Sign up!")

         expect(current_path).to eq("/register")

         fill_in("Name", with: "Billy")
         fill_in("Email", with: "BillyRocks@example.com")
         fill_in("Password", with: "password")
         fill_in("Password confirmation", with: "password")
         click_on("Sign up")

         expect(current_path).to_not eq("/users/billy")
         expect(current_path).to eq("/users")
         expect(User.count).to eq(1)
       end

       it "does not register if email is taken" do
         create(:user)
         visit root_path

         click_on("Sign up!")

         expect(current_path).to eq("/register")

         fill_in("Name", with: "Billy123")
         fill_in("Email", with: "billy@example.com")
         fill_in("Password", with: "password")
         fill_in("Password confirmation", with: "password")
         click_on("Sign up")

         expect(current_path).to_not eq("/users/billy")
         expect(current_path).to eq("/users")
         expect(User.count).to eq(1)
       end
    end
  end
end
