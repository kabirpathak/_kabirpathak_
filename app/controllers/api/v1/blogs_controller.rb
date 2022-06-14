class Api::V1::BlogsController < ApplicationController
  def index
    data = []
    Blog.all.each do |blog|
      data << {
        id: blog.id,
        title: blog.title,
        body: blog.body,
        last_modified: Date.parse(blog.updated_at.to_s).strftime('%d %b, %Y'),
        tags: blog.tags.map(&:name)
      }
    end
    render json: data
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
