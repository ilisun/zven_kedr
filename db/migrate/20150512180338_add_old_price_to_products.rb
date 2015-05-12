class AddOldPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :cb_old_price, :boolean
    add_column :products, :old_price, :string
  end
end
