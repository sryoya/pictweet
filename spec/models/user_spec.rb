require 'rails_helper'
describe User do
  describe '#create' do

    it "is valid with a nickname, an email, and a password" do
    user = build(:user)
    expect(user).to be_valid
    end
    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.invalid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.invalid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid if a nickname is over 6 characters" do
      user = build(:user, nickname: "aaaaaaa")
      user.invalid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 6 characters)")
    end

    it "is valid if a nickname is within 6 characters" do
      user = build(:user, nickname: "aaaaaa")
      expect(user).to be_valid
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is valid if a password is over 7 characters" do
      user = create(:user, password: "11111111", password_confirmation: "11111111")
      expect(user).to be_valid
    end

    it "is invalid if password is within 7 characters" do
      user = build(:user, password: "1111111")
      user.invalid?
      binding.pry
      expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
    end
  end
end