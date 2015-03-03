class CreateCatRelationships < ActiveRecord::Migration
  def change
    create_table :cat_relationships do |t|
      t.integer :category_id
      t.integer :product_id

      t.timestamps
    end
    add_index :cat_relationships, :product_id
    add_index :cat_relationships, :category_id
    add_index :cat_relationships, [:product_id, :category_id], unique: true
  end
end
