class AddDefaultValueToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :shipping_method, :string
  end
end
