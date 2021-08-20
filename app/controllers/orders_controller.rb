class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @product = Product.find(params[:product_id])
    orders = Order.includes(:product)
    count = 0
    orders.each do |order|
      if order.product_id == @product.id
        count = 1
      end
    end
    if count == 1 || current_user.id == @product.user_id
      redirect_to root_path
    else
      @order_buy = OrderBuy.new
    end
  end

  def create
    @product = Product.find(params[:product_id])
    @order_buy = OrderBuy.new(order_params)
    if @order_buy.valid?
      pay_product
      @order_buy.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_buy).permit(:postal_code, :prefecture_id, :city, :address, :building, :telephone).merge(
      token: params[:token], user_id: current_user.id, product_id: params[:product_id]
    )
  end

  def pay_product
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
