class PostsController < ApplicationController
  def new
    @post = Post.new(author: session[:author])
    flash.now[:notice] = "Pamiętaj o ortografii!"
  end

  def create
    # render plain: params
    @post = Post.new(post_params)
    @post.save
    session[:author] = @post.author
    flash[:notice] = "Post dodany pomyślnie."
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    flash[:notice] = "Post zaktualizowany pomyślnie."
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :author, :body, :published)
  end
end
