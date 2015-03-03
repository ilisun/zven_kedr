class ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page]).per(8)
    @categories = Category.all
  end

  def shop
    if params[:cat]
      @products = Product.joins(:categories).where("categories.id = ?", params[:cat]).page(params[:page]).per(8)
    else
      @products = Product.page(params[:page]).per(8)
    end
    @categories = Category.all
  end

  def main
    @m1_products = Product.joins(:categories).where("categories.id = ?", '13').take(4)
    @m2_products = Product.joins(:categories).where("categories.id = ?", '13').take(8)
    @m3_products = Product.joins(:categories).where("categories.id = ?", '13').take(4)
    @m4_products = Product.joins(:categories).where("categories.id = ?", '13').take(5)
    @categories = Category.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
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

  def product_params
    # params.require(:product).permit(:name, :price, :description, :image)
    params.fetch(:product, {}).permit!
  end

end
