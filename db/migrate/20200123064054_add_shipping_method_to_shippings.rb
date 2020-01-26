class AddShippingMethodToShippings < ActiveRecord::Migration[5.2]
  def change
    add_column :shippings, :shipping_method, :integer, null: false
  end
end
