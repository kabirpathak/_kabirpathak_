class AddBlogIdToTags < ActiveRecord::Migration[7.0]
  def change
    add_column :tags, :blog_id, :integer
  end
end
