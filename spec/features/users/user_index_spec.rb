require 'rails_helper'

describe "user sees all users" do
  describe "they visit /users" do
    it "displays all users" do
      user_1 = User.create!(name: "John Smith", email: "john.smith@gmail.com", password: "airplay")
      user_2 = User.create!(name: "Jim Jones", email: "jim.jones@gmail.com", password: "waterway")
      visit users_path

      expect(page).to have_content(user_1.name)
      expect(page).to have_content(user_2.email)
      expect(page).to have_link("Register as User")
    end

    it "they visit /login" do
      visit users_path
      click_on "Log In"
      expect(current_path).to eq(login_path)
    end
  end
end
