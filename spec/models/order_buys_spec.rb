require 'rails_helper'

RSpec.describe OrderBuy, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    @order_buy = FactoryBot.build(:order_buy, user_id: @user.id, product_id: @product.id)
  end

  context '正常に購入できる' do
    it '全ての情報が正しく入力されているとき、購入できる' do
      expect(@order_buy).to be_valid
    end

    it 'buildingが空でも、購入できる' do
      @order_buy.building = ''
      expect(@order_buy).to be_valid
    end
  end

  context 'エラーが発生し購入できない' do
    it 'tokenが空では購入できない' do
      @order_buy.token = ''
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空では購入できない' do
      @order_buy.postal_code = ''
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeにハイフンがないと、購入できない' do
      @order_buy.postal_code = '1234567'
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Postal code はハイフンを入れて７桁の半角数字で入力してください')
    end

    it 'postal_codeが全角のとき、購入できない' do
      @order_buy.postal_code = '１２３−４５６７'
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Postal code はハイフンを入れて７桁の半角数字で入力してください')
    end

    it 'postal_codeが6桁のとき、購入できない' do
      @order_buy.postal_code = '123-456'
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Postal code はハイフンを入れて７桁の半角数字で入力してください')
    end

    it 'postal_codeが8桁のとき、購入できない' do
      @order_buy.postal_code = '123-45678'
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Postal code はハイフンを入れて７桁の半角数字で入力してください')
    end

    it 'prefecture_idが1のとき(選択されていないとき)、購入できない' do
      @order_buy.prefecture_id = 1
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空のとき、購入できない' do
      @order_buy.city = ''
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空のとき、購入できない' do
      @order_buy.address = ''
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include("Address can't be blank")
    end

    it 'telephoneが空のとき、購入できない' do
      @order_buy.telephone = ''
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include("Telephone can't be blank")
    end

    it 'telephoneが全角数字のとき、購入できない' do
      @order_buy.telephone = '０９０１２３４５６７８'
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Telephone はハイフンなしで10、11桁の半角数字で入力してください')
    end

    it 'telephoneが9桁以内のとき、購入できない' do
      @order_buy.telephone = '032456789'
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Telephone はハイフンなしで10、11桁の半角数字で入力してください')
    end

    it 'telephoneが12桁以上のとき、購入できない' do
      @order_buy.telephone = '0901234567890'
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include('Telephone はハイフンなしで10、11桁の半角数字で入力してください')
    end

    it 'user_idが空では、購入できない' do
      @order_buy.user_id = nil
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include("User can't be blank")
    end

    it 'product_idが空では、購入できない' do
      @order_buy.product_id = nil
      @order_buy.valid?
      expect(@order_buy.errors.full_messages).to include("Product can't be blank")
    end
  end
end
