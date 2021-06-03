require 'rails_helper'

RSpec.describe ItemAddress, type: :model do
  describe '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @item_address = FactoryBot.build(:item_address, item_id: item.id, user_id: user.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @item_address.building_name = ''
        expect(@item_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @item_address.postal_code = ''
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @item_address.postal_code = '1231234'
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'region_idを選択していないと保存できないこと' do
        @item_address.region_id = 1
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Region must be other than 1")
      end
      it 'cityが空だと保存できないこと' do
        @item_address.city = ''
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @item_address.address = ''
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @item_address.phone_number = ''
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @item_address.token = ''
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Token can't be blank")
      end
        it 'phone_numberが10字または11字以外だと保存できないこと' do
          @item_address.phone_number = '0801111'
          @item_address.valid?
          expect(@item_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_idが空だと保存できないこと' do
        @item_address.user_id = ''
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @item_address.item_id = ''
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Item can't be blank")
      end
    end
end
end
