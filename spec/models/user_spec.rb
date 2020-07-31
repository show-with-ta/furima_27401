require 'rails_helper'

describe User do
  describe '#create' do
    before do
      @user = build(:user)
    end
    context 'valid' do 
      it 'is valid with a nickname, email, password, family_name, first_name, family_name_kana, first_name_kana, birthday' do
        expect(@user).to be_valid
      end

      it "is invalid without a nickname" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors[:nickname]).to include("can't be blank")
      end
    
      it "is invalid without a email" do
        @user.email = nil
        @user.valid?
        expect(@user.errors[:email]).to include("can't be blank")
      end
    
      it "is invalid with a duplicate email address" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end
    
      it 'is invalid without @ to email' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors[:email]).to include('is invalid')
      end
    
      it "is invalid without a password" do
        @user.password = nil
        @user.valid?
        expect(@user.errors[:password]).to include("can't be blank")
      end
    
      it "is valid with a password that has more than 6 characters " do
        user = build(:user, password: "00000a", password_confirmation: "00000a")
        expect(user).to be_valid
      end
    
      it "is invalid with a password that has less than 5 characters " do
        user = build(:user, password: "0000a", password_confirmation: "0000a")
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end
    
      it "is valid with a password that has half-width english characters" do
        user = build(:user, password: "abcdef", password_confirmation: "abcdef")
        user.valid?
        expect(user.errors[:password]).to include("it lacks half-width numbers")
      end
    
      it "is valid with a password that has half-width numbers characters" do
        user = build(:user, password: "000000", password_confirmation: "000000")
        user.valid?
        expect(user.errors[:password]).to include("it lacks half-width english")
      end
    
      it "is invalid without a password_confirmation although with a password" do
        @user = build(:user, password_confirmation: "")
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end
    
      it "is invalid without a family_name" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors[:family_name]).to include("can't be blank")
      end
    
      it "is invalid without a first_name" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors[:first_name]).to include("can't be blank")
      end
    
      it "is invalid without a family_name_kana" do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors[:family_name_kana]).to include("can't be blank")
      end
    
      it "is invalid without a first_name_kana" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include("can't be blank")
      end
    
      it "is valid with a family_name that has full-width characters" do
        user = build(:user, family_name: "近藤")
        expect(user).to be_valid
      end
    
      it "is valid with a first_name that has full-width characters" do
        user = build(:user, first_name: "彰太")
        expect(user).to be_valid
      end
    
      it "is valid with a first_name that has full-width katakana characters" do
        user = build(:user, family_name_kana: "コンドウ")
        expect(user).to be_valid
      end
    
      it "is valid with a first_name that has full-width katakana characters" do
        user = build(:user, first_name_kana: "ショウタ")
        expect(user).to be_valid
      end
    
      it "is invalid without a birthday" do
        user = build(:user, birthday: nil)
        user.valid?
        expect(user.errors[:birthday]).to include("can't be blank")
      end
    end
  end
end