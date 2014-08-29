class AddImageToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :image_url, :string
  end
end
