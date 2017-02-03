class AddFieldsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :sku, :string, index: true
    add_column :products, :recycle_rate, :integer, index: true
    add_column :products, :logistics_rate, :integer, index: true
  end
end
