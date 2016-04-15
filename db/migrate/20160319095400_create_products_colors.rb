class CreateProductsColors < ActiveRecord::Migration
  def change
    create_table :products_colors do |t|
      t.belongs_to :product, index: true
      t.belongs_to :color, index: true
    end
  end
end
