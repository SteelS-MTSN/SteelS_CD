class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.integer :item_id, null: false
    	t.integer :past_price, null: false
    	t.datetime :purchase_date, null: false
    	t.integer :buy_quantity, null: false

      t.timestamps
    end
  end
end
