class AddCommunityToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :community, index: true
  end
end
