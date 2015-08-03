class OperationsController < ApplicationController

  def show
    @operation = Operation.find(params[:id])
  end

  def edit
    @operation = Operation.find(params[:id])
  end

  def create
    @operation = Operation.new(category_params)

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

  def operation_params
    params.require(:operation).permit!
  end
end
