class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
    	t.string :sub_family_name, null: false
    	t.string :sub_first_name, null: false
    	t.string :sub_family_kana, null: false
    	t.string :sub_first_kana, null: false
    	t.string :sub_post_code, null: false
    	t.string :sub_address, null: false
    	t.integer :user_id, null: false
    	


      t.timestamps
    end
  end
end
