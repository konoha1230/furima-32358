class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all.order('created_at DESC')
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
    @product = Product.find(params[:id])
  end

  def edit
    
  end

  def update
    
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :content, :price, :status_id, :category_id, :delivery_charge_id,
                                    :prefecture_id, :duration_id).merge(user_id: current_user.id)
  end
end
