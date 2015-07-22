class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @category = Category.new
    #@categories = Category.all
  end

  def create
    category = Category.create(name: params[:category][:name])
    redirect_to categories_path, notice: "Created '#{category.name}' Category"
  end
end
