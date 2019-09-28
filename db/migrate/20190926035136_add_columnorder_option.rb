class AddColumnorderOption < ActiveRecord::Migration[5.2]
  def change
  	add_column :order_options, :delivery_day, :date
  end
end
