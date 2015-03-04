class CategoriesController < ApplicationController
  before_action :load_categories

  def show
    @category = Category.find(params[:id])
  end

  def index
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to products_path
    else
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to products_path
  end

  private

  def load_categories
    @categories = Category.all
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
