class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    # render plain: params
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path
  end

  def edit
  end

  def update
  end

  def index
    @posts = Post.all
  end

  def show
  end

  def destroy
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :author, :body, :published)
  end
end
