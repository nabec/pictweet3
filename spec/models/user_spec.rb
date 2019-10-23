require 'rails_helper'
describe User do
  describe '#create' do

    it 'is valid with a nickname, email, password, password_confirmation' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'is invalid without a nickname' do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it 'is invalid without a email' do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without a password' do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'is invalid without a password_confirmation although with a password' do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'is invalid with a nickname that has more than 7 characters' do
      user = build(:user, nickname: "aaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 6 characters)")
    end

  end
end
