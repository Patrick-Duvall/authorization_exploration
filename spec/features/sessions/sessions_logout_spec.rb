require 'rails_helper'

describe "as a registered user" do
  it "allows me to log out" do
    user_1 = User.create!(name: "John Smith", email: "john.smith@gmail.com", password: "airplay")
    # session[:user_id] = user_1.id # effectively logs in
    visit login_path

    fill_in :email, with: user_1.email
    fill_in :password, with: user_1.password

    click_on "Log Me In!"

    click_link("Log Out")

    expect(current_path).to eq(users_path)
    expect(page).to_not have_link("Log Out")
    expect(page).to have_link("Log In")
  end
end
