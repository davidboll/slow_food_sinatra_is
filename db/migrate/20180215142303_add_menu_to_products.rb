class AddMenuToProducts < ActiveRecord::Migration[4.2]
  add_reference :products, :menu, index: true
end
