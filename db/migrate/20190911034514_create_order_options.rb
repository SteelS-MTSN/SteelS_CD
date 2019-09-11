class CreateOrderOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :order_options do |t|
    	t.integer :payment, null: false
    	t.integer :delivery_status, null: false
    	t.integer :postage, null: false
    	t.integer :total_price, null: false
    	t.string :to_post_code, null: false
    	t.string :to_address, null: false
    	t.string :to_name, null: false
    	t.string :to_kana, null: false
    	t.integer :item_id, null: false
    	t.integer :user_id, null: false

      t.timestamps
    end
  end
end
