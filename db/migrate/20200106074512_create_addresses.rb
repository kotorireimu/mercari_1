class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user     , foreign_key: true
      t.string :post_number,null: false
      t.string :prefecture,null: false
      t.string :city,null: false
      t.string :address_line,null: false
      t.string :building_name
      t.timestamps
    end
  end
end
