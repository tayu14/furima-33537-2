require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @address = FactoryBot.build(:order_address)
  end

  describe "住所登録" do

    context '住所登録できる場合' do
      it '全て正しく入力されている場合' do
        expect(@address).to be_valid
      end
    end
  end

    context '住所登録できない時' do

      it "郵便番号が空だと登録できない" do
        @address.postal_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include "Postal code can't be blank"
      end

      it "郵便番号にハイフンがないと登録できない" do
        @address.postal_code = "1234567"
        @address.valid?
        expect(@address.errors.full_messages).to include "Postal code is invalid"
      end

      it "市区町村が空だと登録できない" do
        @address.municipality = nil
        @address.valid?
        expect(@address.errors.full_messages).to include "Municipality can't be blank"
      end

      it "県が1だと登録できない" do
        @address.prefecure_id = "1"
        @address.valid?
        expect(@address.errors.full_messages).to include "Prefecure must be other than 1"
      end

      it "番地が空だと登録できない" do
        @address.fandee = nil
        @address.valid?
        expect(@address.errors.full_messages).to include "Fandee can't be blank"
      end

      it "電話番号が空だと登録できない" do
        @address.phone_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include "Phone number can't be blank"
      end

      it "電話番号が12桁以上だと登録できない" do
        @address.phone_number = 123456789012
        @address.valid?
        expect(@address.errors.full_messages).to include "Phone number is invalid"
      end

      it "電話番号にハイフンがあると登録できない" do
        @address.phone_number = 1234-5678901
        @address.valid?
        expect(@address.errors.full_messages).to include "Phone number is invalid"
      end

      it "tokenが空だと登録できない" do
        @address.token = ""
        @address.valid?
        expect(@address.errors.full_messages).to include "Token can't be blank"
      end
    end
end
 