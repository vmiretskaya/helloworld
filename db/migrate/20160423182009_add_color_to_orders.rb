class AddColorToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :color_id, :integer, index: true
  end
end
