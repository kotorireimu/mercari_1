require 'rails_helper'

describe User do
  describe '#create' do
    it "is valid with a nickname, email, password, password_confirmation, birth_year, birth_month, birth_day, family_name, first_name, family_name_kana, first_name_kana " do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid with a nickname that has more than 20 characters " do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 20 characters)")
    end

    it "is valid with a nickname that has less than 19 characters " do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaa")
      expect(user).to be_valid
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.tell)
      another_user.valid?
      expect(another_user.errors[:tell]).to include("has already been taken")
    end

    it "is valid with a password that has more than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it "is invalid with a family_name that has numbers and special characters " do
      user = build(:user, family_name: "1")
      user.valid?
      expect(user.errors[:family_name]).to include('に数字や特殊文字は使用できません')
    end

    it "is invalid with a first_name that has numbers and special characters " do
      user = build(:user, first_name: "1")
      user.valid?
      expect(user.errors[:first_name]).to include('に数字や特殊文字は使用できません')
    end

    it "is invalid with a family_name_kana that has other than katakana " do
      user = build(:user, family_name_kana: "なかやま") 
      user.valid?
      expect(user.errors[:family_name_kana]).to include('はカタカナで入力して下さい')
    end

    it "is invalid with a first_name_kana that has other than katakana " do
      user = build(:user, first_name_kana: "ゆうさく") 
      user.valid?
      expect(user.errors[:first_name_kana]).to include('はカタカナで入力して下さい')
    end

    it "is invalid with a tell that has less than 9 characters" do
      user = build(:user, tell: "000000000")
      user.valid?
      expect(user.errors[:tell]).to include('は半角数字で入力してください')
    end

    it "is invalid with a tell that has numbers of full pitch character" do
      user = build(:user, tell: "００００００００００")
      user.valid?
      expect(user.errors[:tell]).to include('は半角数字で入力してください')
    end
  end
end