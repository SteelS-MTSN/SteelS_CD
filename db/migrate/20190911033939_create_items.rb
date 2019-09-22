class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
    	t.string :item_name, null: false
    	t.integer :artist_id
    	t.integer :price, null: false
    	t.integer :genre_id
    	t.integer :label_id
    	t.integer :items_status, null: false, default: 0
    	t.boolean :is_deleted, null: false, default: false
      t.string :image_id
      t.timestamps
    end
  end
end
