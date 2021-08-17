class OrderBuy
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :address, :building, :telephone, :user_id, :product_id

  with_options presence: true do
    validates :city, :address, :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'はハイフンを入れて７桁の半角数字で入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: 'はハイフンなしで10、11桁の半角数字で入力してください' }
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Buy.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building,
               telephone: telephone, order_id: order.id)
  end
end
