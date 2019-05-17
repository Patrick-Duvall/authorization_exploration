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




# As a Visitor
# When I visit the user index
# And click on 'Register as User'
# I am taken to a new user form
# When I fill out that form and click 'Create User'
# I am redirected back to user index
# And see the new user
