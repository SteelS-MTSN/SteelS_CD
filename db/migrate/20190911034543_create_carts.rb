class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
    	t.integer :quantity, null: false, default: 1
    	t.integer :user_id, null: false
    	t.integer :item_id, null: false


      t.timestamps
    end
  end
end
