class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new
  end

  def create
    @restaurant = Restaurant.find(params[:id])
    @review = @restaurant.reviews.new(review_params)
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
