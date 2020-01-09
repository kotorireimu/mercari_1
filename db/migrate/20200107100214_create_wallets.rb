class CreateWallets < ActiveRecord::Migration[5.2]
  def change
    create_table :wallets do |t|
      t.references :user ,null: false, foreign_key: true
      t.integer :money ,null: false
      t.timestamps
    end
  end
end
