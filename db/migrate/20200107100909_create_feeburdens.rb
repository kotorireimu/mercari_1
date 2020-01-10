class CreateFeeburdens < ActiveRecord::Migration[5.2]
  def change
    create_table :feeburdens do |t|
      t.string :name , null: false
      
      t.timestamps
    end
  end
end
