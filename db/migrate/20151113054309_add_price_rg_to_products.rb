class AddPriceRgToProducts < ActiveRecord::Migration
  def change
    add_column :products, :price_rg, :decimal, :precision => 10, :scale => 2
    add_column :products, :cb_old_price_rg, :boolean
    add_column :products, :old_price_rg, :string
  end
end
