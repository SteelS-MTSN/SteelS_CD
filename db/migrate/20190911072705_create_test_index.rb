class CreateTestIndex < ActiveRecord::Migration[5.2]
  def change
  	add_index :users, :family_name
  	add_index :users, :first_name
  	add_index :users, :family_kana
  	add_index :users, :first_kana
  	add_index :items, :item_name
  	add_index :items, :artist_id
  	add_index :songs, :song_name
  end
end
