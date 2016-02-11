class ChangeAttributesOfPosts < ActiveRecord::Migration
  def change
  	rename_column :posts, :body, :content
  	remove_column :posts, :published
  end
end
