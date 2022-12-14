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
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "商品画像を入力してください"
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it 'nameが40文字より上は登録できない' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名は40文字以内で入力してください"
      end
      it 'describeが空では登録できない' do
        @item.describe = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end
      it 'describeが1000文字より上は登録できない' do
        @item.describe = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明は1000文字以内で入力してください"
      end
      it 'category_idが---では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを選択してください"
      end
      it 'condition_idが---では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を選択してください"
      end
      it 'shipping_charge_idが---では登録できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を選択してください"
      end
      it 'ship_from_idが---では登録できない' do
        @item.ship_from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域を選択してください"
      end
      it 'delivery_duration_idが---では登録できない' do
        @item.delivery_duration_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を選択してください"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "価格を入力してください"
      end
      it 'priceが300より下では登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include "価格は300円以上 9,999,999円以下を入力してください"
      end
      it 'priceが9999999より上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include "価格は300円以上 9,999,999円以下を入力してください"
      end
      it 'priceが全角数字では登録できない' do
        @item.price = '３００００'
        @item.valid?
        expect(@item.errors.full_messages).to include "価格は半角の数字を入力してください"
      end
      it 'userが紐付いていないと商品は保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Userを入力してください"
      end
    end
  end
end
