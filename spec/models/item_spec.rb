require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context '商品が保存できる場合' do
      it 'すべての記載があれば商品は保存される' do
        expect(@item).to be_valid
      end
    end
    context '商品が保存できない場合' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'nameが40文字より上は登録できない' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include 'Name is too long (maximum is 40 characters)'
      end
      it 'describeが空では登録できない' do
        @item.describe = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Describe can't be blank"
      end
      it 'describeが1000文字より上は登録できない' do
        @item.describe = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include 'Describe is too long (maximum is 1000 characters)'
      end
      it 'category_idが---では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'condition_idが---では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'shipping_charge_idが---では登録できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping charge can't be blank"
      end
      it 'ship_from_idが---では登録できない' do
        @item.ship_from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Ship from can't be blank"
      end
      it 'delivery_duration_idが---では登録できない' do
        @item.delivery_duration_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery duration can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300より下では登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range'
      end
      it 'priceが9999999より上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range'
      end
      it 'priceが全角数字では登録できない' do
        @item.price = '３００００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Half-width number'
      end
      it 'userが紐付いていないと商品は保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
    end
  end
end
