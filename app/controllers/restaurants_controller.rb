class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
  end

  def create
    @restaurant = Restaurant.new(params[:restaurant])
    @restaurant.save
  end

  private
  
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
