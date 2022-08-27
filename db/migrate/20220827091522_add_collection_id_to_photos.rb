class AddCollectionIdToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_column :photos, :collection_id, :integer
  end
end
