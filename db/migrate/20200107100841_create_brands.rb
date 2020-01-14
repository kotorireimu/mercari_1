class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name , null: false
      t.integer :ancestry
      t.timestamps
    end
  end
end
