class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @product = Product.find(params[:product_id])
    unless current_user.id == @product.user_id
      @order_buy = OrderBuy.new
    else
      redirect_to root_path
    end
  end

  def create
    @product = Product.find(params[:product_id])
    @order_buy = OrderBuy.new(order_params)
    if @order_buy.valid?
      @order_buy.save
      redirect_to "products#index"
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_buy).permit(:postal_code, :prefecture_id, :city, :address, :building, :telephone)
  end
end
