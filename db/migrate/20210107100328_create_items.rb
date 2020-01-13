class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name  ,null: false
      t.integer    :price ,null: false
      t.string     :text  ,null: false
      t.references :category ,null: false, foreign_key: true
      t.references :condition ,null: false, foreign_key: true
      t.references :feeburden ,null: false, foreign_key: true
      t.references :region ,null: false, foreign_key: true
      t.references :handingtime ,null: false, foreign_key: true
      t.references :user ,null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
