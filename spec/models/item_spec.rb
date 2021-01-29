require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "出品情報" do

    context '商品を登録できる場合' do
      it '全て正しく入力されている場合' do
        expect(@item).to be_valid
      end
    end

    context '商品登録ができない時' do

      it "画像が空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "商品名が空だと登録できない" do
        @item.goods_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Goods name can't be blank"
      end
      it "商品説明が空だと登録できない" do
        @item.goods_explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Goods explanation can't be blank"
      end
      it "カテゴリーが1だと登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it "商品状態が1だと登録できない" do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 1"
      end
      it "配送料負担が1だと登録できない" do
        @item.prefecure_money_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecure money must be other than 1"
      end
      it "発送先が1だと登録できない" do
        @item.prefecure_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecure must be other than 1"
      end
      it "発送までの日数が1だと登録できない" do
        @item.scheduled_delivery_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Scheduled delivery must be other than 1"
      end
      it "販売額が空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "販売額が全角文字だと登録できない" do
        @item.price = "ああああ"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it "販売額が半角英数混合だと登録できない" do
        @item.price = "2i3jb"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it "販売額が半角英語だと登録できない" do
        @item.price = "efa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it "販売額が299だと以下だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than 299"
      end
      it "販売額が10000000以上だと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than 10000000"
      end
    end
  end
end
