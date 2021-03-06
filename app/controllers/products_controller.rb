class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_data, only: [:show, :edit, :update, :destroy]
  before_action :user_judge, only: [:edit, :update, :destroy]
  before_action :get_data_order, only: [:index, :show, :edit, :destroy]
  before_action -> { order_counter(@orders, @product) }, only: [:show, :edit, :destroy]

  def index
    @products = Product.all.order('created_at DESC')
    @count = 0
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @count == 1
      redirect_to root_path
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def destroy
    if @count == 0
      @product.destroy
    end
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :content, :price, :status_id, :category_id, :delivery_charge_id,
                                    :prefecture_id, :duration_id).merge(user_id: current_user.id)
  end

  def get_data
    @product = Product.find(params[:id])
  end

  def get_data_order
    @orders = Order.includes(:product)
  end

  def order_counter(orders, product)
    @count = 0
    orders.each do |order|
      if order.product_id == product.id
        @count = 1
        return
      end
    end
  end

  def user_judge
    redirect_to root_path unless @product.user_id == current_user.id
  end
end
