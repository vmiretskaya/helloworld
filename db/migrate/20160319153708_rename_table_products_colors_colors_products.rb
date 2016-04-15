class RenameTableProductsColorsColorsProducts < ActiveRecord::Migration
  def change
  	rename_table('products_colors', 'colors_products')
  end
end
