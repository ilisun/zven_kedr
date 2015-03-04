class StaticsController < ApplicationController
  before_action :load_categories

  def prod
  end

  private

  def load_categories
    @categories = Category.all
  end

end
