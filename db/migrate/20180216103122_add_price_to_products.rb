class AddPriceToProducts < ActiveRecord::Migration[4.2]
  def change
    add_column :products, :price, :integer
  end
end
