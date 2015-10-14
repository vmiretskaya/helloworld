class ChangePriceType < ActiveRecord::Migration
  def change
  
  	change_column(:products, :price, :integer)
  	change_column(:orders, :total, :integer)
  end
end
