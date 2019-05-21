class PostsController < ApplicationController

 #work on this
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.photos.build
  end

  def create
    @post = Post.new(title: params['post'][:title],
                     description: params['post'][:description],
                     address: params['post'][:address],
                     price: params['post'][:price],
                     user: current_user)
    if @post.save
      @photo = Photo.new(source: params['post']['photos_attributes']['0']['source'],
                         post: @post)
      @photo.save
      redirect_to post_path(@post.id)
    else
      redirect_to new_post_path
    end
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
    @user = @post.user
  end

  def edit
  end

end
