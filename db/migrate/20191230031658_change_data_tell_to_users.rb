class ChangeDataTellToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :tell, :integer
  end
end
