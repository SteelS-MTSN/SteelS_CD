class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
    	t.string :item_name, null: false
    	t.integer :artist_id, null: false
    	t.integer :price, null: false
    	t.integer :genre_id, null: false
    	t.integer :label_id, null: false
    	t.integer :items_status, null: false, default: 0
    	t.boolean :is_deleted, null: false, default: false
    	t.integer :artist_id, null: false
    	t.integer :genre_id, null: false
    	t.integer :label_id, null: false


      t.timestamps
    end
  end
end
