class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.references :item , null: false, foreign_key: true
      t.integer :handing_time , null: false
      t.integer :region , null: false
      t.integer :shipping_way , null: false
      t.integer :fee_burden , null: false
      t.timestamps
    end
  end
end
