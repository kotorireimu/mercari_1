class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :item , null: false, foreign_key: true
      t.references :user , null: false, foreign_key: true
      t.string     :text , null: false
      t.timestamps
    end
  end
end
