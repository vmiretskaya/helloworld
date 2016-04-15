class RemoveColorFromProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :color_id, :integer
  end
end
