class OrderBuy
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :telephone

  with_options presence: true do
    validates :postal_code, :city, :address
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :telephone, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
  end

  def save
    order = Order.create
    Buy.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, telephone: telephone, order: order.id)
  end
end