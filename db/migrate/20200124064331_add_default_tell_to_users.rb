class AddDefaultTellToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :tell, :string, default: ""
  end
end
