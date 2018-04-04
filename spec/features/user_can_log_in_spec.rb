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

        fill_in("name", with: "Billy")
        fill_in("password", with: "password")
        click_on("Sign in")

        expect(current_path).to eq("/users/billy")
      end
    end
  end
end
