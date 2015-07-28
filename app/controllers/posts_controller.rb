class PostsController < ApplicationController

  def index
    @posts = Post.page(params[:page]).per(6)
  end

  def show
    @posts = Post.all
    @post = Post.find_by(url_key: params[:url_key])

    #show related articles
    post = @posts
    @related = post.where("id != ?", @post.id).limit(3)
  end


end  