class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to product_path(@product)
  end

  private
  def comment_params
    params.permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
