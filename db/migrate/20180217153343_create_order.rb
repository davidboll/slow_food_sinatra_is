class CreateOrder < ActiveRecord::Migration[4.2]
  def change
    create_table :orders do |t|
      t.timestamps
    end
  end
end
