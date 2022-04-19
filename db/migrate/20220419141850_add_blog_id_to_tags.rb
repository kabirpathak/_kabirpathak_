class AddBlogIdToTags < ActiveRecord::Migration[6.1]
  def change
    add_column :tags, :blog_id, :integer
  end
end
