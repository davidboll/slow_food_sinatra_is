class Cart < ActiveRecord::Migration[4.2]
  def change
    create_table :carts do |t|
      t.fixnum :order_id
    end
  end
end
