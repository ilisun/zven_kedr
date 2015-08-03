class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:main, :show]
  before_action :load_categories

  def index
    @videos = Video.page(params[:page]).order("created_at DESC").per(8)
  end

  def show
    @video = Video.find(params[:id])
  end

  def new
    @video = Video.new
  end

  def main
    @videos = Video.page(params[:page]).order("created_at DESC").per(8)
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to videos_path, notice: "The article has been successfully created."
    else
      render action: "new"
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(video_params)
      redirect_to videos_path, notice: "The article has been successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @video = Video.find(params[:id])

    @video.destroy
    redirect_to videos_path, notice: "The article has been successfully deleted."
  end

  private

  def load_categories
    @categories = Category.where("id > ?", '4').order(:id)
  end

  def video_params
    params.require(:video).permit(:name, :body)
  end
end
