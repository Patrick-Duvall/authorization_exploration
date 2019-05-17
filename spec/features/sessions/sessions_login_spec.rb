require 'rails_helper'

describe "as a visitor" do
  describe "when I visit /login" do
    it "allows me to login" do
      user_1 = User.create!(name: "John Smith", email: "john.smith@gmail.com", password: "airplay")

      visit login_path

      fill_in :email, with: user_1.email
      fill_in :password, with: user_1.password

      click_on "Log Me In!"

      expect(current_path).to eq(users_path)
      expect(page).to have_content("Welcome #{user_1.name}, you are logged in!")
      expect(page).to_not have_link("Log In")
    end

    it "does not allow invalid user to log in" do
      user_1 = User.create!(name: "John Smith", email: "john.smith@gmail.com", password: "airplay")

      visit login_path

      fill_in :email, with: "notjohn.smith@gmail.com"
      fill_in :password, with: user_1.password

      click_on "Log Me In!"

      expect(current_path).to eq(login_path)
    end
  end
end
