require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}
  end

  it "authenticates a user by email and password" do
    user_1 = User.create!(name: "Joe", email: "joe@gmial.com", password: "elephant")

    expect(User.authenticate(user_1.email, user_1.password)).to eq(user_1)
    expect(User.authenticate("notjoe@gmail.com", user_1.password)).to eq(nil)
    expect(User.authenticate(user_1.email, "notelephant")).to eq(nil)
  end


end
