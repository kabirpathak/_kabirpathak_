class AddCollectionIdToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :collection_id, :integer
  end
end
