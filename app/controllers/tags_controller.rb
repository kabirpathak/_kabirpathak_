class TagsController < ApplicationController
  def show
    tags = Tag.where(blog_id: params[:blog_id])
    render json: { tag: tags }
  end

  def create
    tag = Tag.new(tag_params)
    if tag.save
      render json: { status: 'success', message: 'Tag created successfully' }
    else
      render json: { errors: tag.errors.full_messages, status: 'error' }
    end
  end

  def delete
    tag = Tag.find(params[:id])
    tag.destroy
    render json: { status: 'success', message: 'Tag deleted successfully' }
  rescue StandardError => e
    render json: { errors: e.errors.full_messages, status: 'error' }
  end

  private

  def tag_params
    params.require(:tag).permit(:id, :name, :blog_id)
  end
end
