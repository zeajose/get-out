class PostsController < ApplicationController
  def index
  end

  def show
  end

  def destroy
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

  def edit
  end
end
