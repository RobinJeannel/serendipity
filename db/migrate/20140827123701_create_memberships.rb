class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :community_id

      t.timestamps
    end
    add_index :memberships, :user_id
  end
end
