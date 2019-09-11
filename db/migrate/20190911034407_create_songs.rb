class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
    	t.string :song_name, null: false
    	t.integer :disc_number, null: false
    	t.integer :track_number, null: false
    	t.integer :item_id, null: false
    	


      t.timestamps
    end
  end
end
