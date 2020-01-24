class AddColumnUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :birth, :date
  end

  def down
    remove_column :users, :birth_day, :integer
  end
end
