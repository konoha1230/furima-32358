require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  context '出品が正常にできる時' do
    it '全てのデータが正常に入力されている時、出品できる' do
      expect(@product).to be_valid
    end
  end

  context '出品が何かしらのエラーでできない時' do
    it 'nameが空では出品できない' do
      @product.name = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'contentが空では出品できない' do
      @product.content = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Content can't be blank")
    end

    it 'priceが空では出品できない' do
      @product.price = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが全角数字の時。出品できない' do
      @product.price = '５００'
      @product.valid?
      expect(@product.errors.full_messages).to include('Price is not a number')
    end

    it 'priceがひらがなの時、出品できない' do
      @product.price = 'ごひゃく'
      @product.valid?
      expect(@product.errors.full_messages).to include('Price is not a number')
    end

    it 'priceが全角カタカナの時。出品できない' do
      @product.price = 'ゴヒャク'
      @product.valid?
      expect(@product.errors.full_messages).to include('Price is not a number')
    end

    it 'priceが半角カタカナの時、出品できない' do
      @product.price = 'ｺﾞﾋｬｸ'
      @product.valid?
      expect(@product.errors.full_messages).to include('Price is not a number')
    end

    it 'priceが漢字の時。出品できない' do
      @product.price = '五百'
      @product.valid?
      expect(@product.errors.full_messages).to include('Price is not a number')
    end

    it 'priceが英数混同では出品できない' do
      @product.price = '5 hundred'
      @product.valid?
      expect(@product.errors.full_messages).to include('Price is not a number')
    end

    it 'priceが全角英字では出品できない' do
      @product.price = 'ｆｉｖｅｈｕｎｄｒｅｄ'
      @product.valid?
      expect(@product.errors.full_messages).to include('Price is not a number')
    end

    it 'priceが半角英字では出品できない' do
      @product.price = 'five hundred'
      @product.valid?
      expect(@product.errors.full_messages).to include('Price is not a number')
    end

    it 'priceが300未満の時。出品できない' do
      @product.price = 299
      @product.valid?
      expect(@product.errors.full_messages).to include('Price is not included in the list')
    end

    it 'priceが1000万以上の時、出品できない' do
      @product.price = 10000000
      @product.valid?
      expect(@product.errors.full_messages).to include('Price is not included in the list')
    end

    it 'status_idが選択されていない時、出品できない' do
      @product.status_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Status can't be blank")
    end

    it 'delivery_charge_idが選択されていない時、出品できない' do
      @product.delivery_charge_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Delivery charge can't be blank")
    end

    it 'category_idが選択されていない時、出品できない' do
      @product.category_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

    it 'prefecture_idが選択されていない時、出品できない' do
      @product.prefecture_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'duration_idが選択されていない時、出品できない' do
      @product.duration_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Duration can't be blank")
    end

    it 'userが紐づいていない時、出品できない' do
      @product.user = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('User must exist')
    end

    it '画像が選択されていない時、出品できない' do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end
  end
end
