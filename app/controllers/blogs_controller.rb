class BlogsController < ApplicationController
  def index
    render json: { blogs: Blog.all }
  end

  def show
    blog = Blog.find(params[:id])
    render json: { blog: blog, date: blog.created_at, last_modified: blog.updated_at, comments: blog.comments }
  end

  def create
    blog = Blog.new(blog_params)
    if blog.save
      render json: { status: 'success', message: 'Blog created successfully' }
    else
      render json: { errors: blog.errors.full_messages, status: 'error' }
    end
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    render json: { status: 'success', message: 'Blog updated successfully' }
  rescue StandardError => e
    render json: { errors: e.errors.full_messages, status: 'error' }
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    render json: { status: 'success', message: 'Blog deleted successfully' }
  rescue StandardError => e
    render json: { errors: e.errors.full_messages, status: 'error' }
  end

  private

  def blog_params
    params.require(:blog).permit(:id, :title, :text, :created_at, :updated_at)
  end
end
