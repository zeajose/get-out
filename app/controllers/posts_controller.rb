class PostsController < ApplicationController

 #work on this
  def index
    @posts = Post.all
  end

#jose
  def new
  end

#jose
  def create
  end

  def update
  end

#work on this
  def destroy
    @post = Post.find(params[:id])
    @post.delete
  end

 #work on this
  def show
      @post = Post.find(params[:id])
    end

  def edit
  end

end
