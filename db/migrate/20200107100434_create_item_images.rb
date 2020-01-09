class CreateItemImages < ActiveRecord::Migration[5.2]
  def change
    create_table :item_images do |t|
      t.references :item , null: false
      t.string     :image_url , null: false
      t.timestamps
    end
  end
end