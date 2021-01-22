require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do


    context 'ユーザー登録できるとき' do
      it '全て正しく入力されている場合' do
        expect(@user).to be_valid
      end
    end
    
    context 'ユーザー登録ができない時' do

      it "nick_nameが空だと登録できない" do
        @user.nick_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nick name can't be blank"
      end
      it "名前が空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it "名前が半角だと登録できない" do
        @user.first_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it "苗字が空だと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it "苗字が半角だと登録できない" do
        @user.family_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name is invalid"
      end
      it "名前（カタカナ）が空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it "名前（カタカナ）が半角だと登録できない" do
        @user.first_name_kana = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
      it "苗字（カタカナ）が空だと登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end
      it "苗字（カタカナ）が半角だと登録できない" do
        @user.family_name_kana = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana is invalid"
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "emailが同じだと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it "@がないと登録できない" do
        @user.email = "sss"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordは英数字でないと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "誕生日が空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end
  end
end
