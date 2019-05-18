require 'rails_helper'

describe "as a visitor that visits secret path" do
  it "redirects me to login" do
    visit secret_path

    expect(current_path).to eq(login_path)
  end
end

describe "as a valid user that visits secret path" do
  it "displays the secret page" do
    user_1 = User.create!(name: "John Smith", email: "john.smith@gmail.com", password: "airplay")

    visit login_path

    fill_in :email, with: user_1.email
    fill_in :password, with: user_1.password

    click_on "Log Me In!"

    visit secret_path

    expect(current_path).to eq(secret_path)
    expect(page).to have_content("Secret Page")
  end
end
