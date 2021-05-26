require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '出品に必要な情報が存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it '価格が半角数字なら出品できる' do
        @item.price = 1000
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end
      it 'カテゴリーが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が空では出品できない' do
        @item.product_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it '配送料の負担が空では出品できない' do
        @item.ship_base_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship base can't be blank")
      end
      it '発送元の地域が空では出品できない' do
        @item.region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it '発送までの日数が空では出品できない' do
        @item.ship_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date can't be blank")
      end
      it '価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が全角数字では出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '価格が300~9999999円以外では出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '価格が10000000円以上では登録できないでは出品できない' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '価格が半角英字では出品できない' do
        @item.price = 'abcdefg'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '価格が半角英数字混合では出品できない' do
        @item.price = 'abc123'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'カテゴリーが空では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態が空では出品できない' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition must be other than 1")
      end
      it '配送料の負担が空では出品できない' do
        @item.ship_base_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship base must be other than 1")
      end
      it '発送元の地域が空では出品できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region must be other than 1")
      end
      it '発送までの日数が空では出品できない' do
        @item.ship_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date must be other than 1")
      end
  end
 end
end
