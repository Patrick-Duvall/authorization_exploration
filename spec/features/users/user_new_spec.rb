require 'rails_helper'

describe "as a visitor" do
  describe "I can create a new user" do
    it "allows me to create a new user" do

      visit users_path

      click_on "Register as User"

      fill_in :user_name, with: "New Name"
      fill_in :user_email, with: "username@gmail.com"
      fill_in :user_password, with: "elephant"

      click_on "Create User"

      expect(current_path).to eq(users_path)
      expect(page).to have_content("New Name")
      expect(page).to have_content("username@gmail.com")

    end
  end
end
