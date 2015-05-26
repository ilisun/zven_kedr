class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:main, :show]
  before_action :load_categories

  def index
    @articles = Article.page(params[:page]).order("created_at DESC").per(8)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def main
    @articles = Article.page(params[:page]).order("created_at DESC").per(8)
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: "The article has been successfully created."
    else
      render action: "new"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to articles_path, notice: "The article has been successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy
    redirect_to articles_path, notice: "The article has been successfully deleted."
  end

  private

  def load_categories
    @categories = Category.where("id > ?", '4').order(:id)
  end

  def article_params
    params.require(:article).permit(:name, :body)
  end

end
