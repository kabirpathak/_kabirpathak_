class Api::V1::CollectionsController < ApplicationController
  def index
    collections = []
    Collection.all.each do |collection|
      collections << {
        title: collection.title,
        photos: collection.photos,
        videos: collection.videos
      }
    end
    render json: collections
  end

  private

  def collection_params
    params.require(:collection).permit(:title)
  end
end
