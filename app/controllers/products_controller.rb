class ProductsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @review = review.create(review_params)
    @review.user_id = current_user.id
    redirect_to review_path(@review)
  end

  def index
    @products = Product.all.order(created_at: :desc)
    @reviews = Review.all
  end

  def show
    @product = Product.find params[:id]
    @ratings = [1,2,3,4,5]
  end

end
