class OperationsController < ApplicationController
  before_action :load_categories

  def show
    @operation = Operation.find(params[:id])
  end

  def new
    @operation = Operation.new
  end

  def edit
    @operation = Operation.find(params[:id])
  end

  def create
    @operation = Operation.new(operation_params)

    if @operation.save
      redirect_to products_path
    else
      render :new
    end
  end

  def update
    @operation = Operation.find(params[:id])
    @operation.update_attributes(operation_params)
    respond_with_bip(@operation)
  end

  private

  def load_categories
    @categories = Category.where("id > ?", '4').order(:id)
  end

  def operation_params
    params.require(:operation).permit!
  end

end
