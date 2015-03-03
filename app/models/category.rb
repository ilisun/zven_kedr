class Category < ActiveRecord::Base

  has_many :cat_relationships, dependent: :destroy
  has_many :products, through: :cat_relationships


end
