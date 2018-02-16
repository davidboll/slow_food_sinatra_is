class AddMenuToProducts < ActiveRecord::Migration[4.2]
  def change
    add_reference :products, :menu, index: true
  end
end
