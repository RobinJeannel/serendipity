class AddSlugToUsers < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string, default: '', null: false
    add_index :users, :slug, unique: true
  end
end
