class AddUserIdToCommunity < ActiveRecord::Migration
  def change
    add_column :communities, :user_id, :integer
    add_index :communities, :user_id
  end
end
