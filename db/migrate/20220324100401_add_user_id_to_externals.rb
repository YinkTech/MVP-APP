class AddUserIdToExternals < ActiveRecord::Migration[7.0]
  def change
    add_column :externals, :user_id, :integer
    add_index :externals, :user_id
  end
end
