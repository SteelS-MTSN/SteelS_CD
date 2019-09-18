class AddColumnToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_option_id, :integer
  end
end
