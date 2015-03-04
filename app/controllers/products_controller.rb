class ProductsController < ApplicationController
  before_action :load_categories, except: [:index]

  def index
    @products = Product.page(params[:page]).order(:id).per(8)
    @categories = Category.all.order(:id)
  end

  def shop
    if params[:cat]
      @products = Product.joins(:categories).where("categories.id = ?", params[:cat]).page(params[:page]).order(:id).per(16)
    else
      @products = Product.page(params[:page]).order(:id).per(16)
    end
  end

  def main
    @m1_products = Product.joins(:categories).where("categories.id = ?", '1').take(4)
    @m2_products = Product.joins(:categories).where("categories.id = ?", '2').take(8)
    @m3_products = Product.joins(:categories).where("categories.id = ?", '3').take(4)
    @m4_products = Product.joins(:categories).where("categories.id = ?", '4').take(4)
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
    @products = Product.joins(:categories).order("RANDOM()").take(4)
    # @products = Product.joins(:categories).where("categories.id = ?", '20').order("RANDOM()").take(4)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      if params[:product][:image].blank?
        redirect_to products_path
      else
        render :crop
      end
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      if params[:product][:image].blank?
        redirect_to products_path
      else
        render :crop
      end
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.image = nil
    @product.save
    @product.destroy

    redirect_to products_path
  end

  private

  def load_categories
    @categories = Category.where("id > ?", '4').order(:id)
  end

  def product_params
    # params.require(:product).permit(:name, :price, :description, :image)
    params.fetch(:product, {}).permit!
  end

end
