class CollectionsController < ApplicationController
    def index; end
  
    def show; end
  
    private

    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @blog = Collection.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def collection_params
      params.require(:collection).permit(:title)
    end
  end
  