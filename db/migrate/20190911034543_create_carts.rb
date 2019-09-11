class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
    	t.string :quantity, null: false
    	t.integer :user_id, null: false
    	t.integer :item_id, null: false


      t.timestamps
    end
  end
end
