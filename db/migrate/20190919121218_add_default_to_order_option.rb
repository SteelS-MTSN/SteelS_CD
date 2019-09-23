class AddDefaultToOrderOption < ActiveRecord::Migration[5.2]
  def change
  	change_column :order_options, :delivery_status, :integer, default: 0
  end
end
