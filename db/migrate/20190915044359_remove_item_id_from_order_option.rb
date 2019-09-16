class RemoveItemIdFromOrderOption < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_options, :item_id, :integer
  end
end
