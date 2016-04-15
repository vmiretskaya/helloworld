class ChangeColorsTable < ActiveRecord::Migration
  def change
  	add_column :colors, :hexcolor, :string
  	remove_column :colors, :name,  :string
  	remove_column :colors, :image, :string
  end
end
