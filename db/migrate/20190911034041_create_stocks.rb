class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
    	t.date :stock_date, null: false
    	t.integer :stock_count, null: false
    	t.string :trader, null: false
    	t.integer :trade_price, null: false
    	t.integer :item_id, null: false

      t.timestamps
    end
  end
end
