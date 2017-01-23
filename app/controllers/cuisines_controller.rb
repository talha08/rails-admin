class CuisinesController < ApplicationController

  before_action :require_user, only: [:index, :show]
  def index
    @cuisines = Cuisine.all
  end

  def show
    @cuisine = Cuisine.find(params[:id])
    @recipes = @cuisine.recipes
  end

end
