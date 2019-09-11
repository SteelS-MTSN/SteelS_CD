class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
    	t.text :review_text, null: false
    	t.integer :user_id, null: false
    	t.integer :item_id, null: false
    	

      t.timestamps
    end
  end
end
