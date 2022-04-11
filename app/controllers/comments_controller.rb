class CommentsController < ApplicationController
  def show
    comments = Comment.where(blog_id: params[:blog_id])
    render json: { comments: comments }
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: { status: 'success', message: 'Comment created successfully' }
    else
      render json: { errors: comment.errors.full_messages, status: 'error' }
    end
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    render json: { status: 'success', message: 'Comment updated successfully' }
  rescue StandardError => e
    render json: { errors: e.errors.full_messages, status: 'error' }
  end

  def delete
    comment = Comment.find(params[:id])
    comment.destroy
    render json: { status: 'success', message: 'Comment deleted successfully' }
  rescue StandardError => e
    render json: { errors: e.errors.full_messages, status: 'error' }
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :message, :blog_id, :created_at, :updated_at)
  end
end
