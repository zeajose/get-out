class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @posts = Post.where.not(latitude: nil, longitude: nil)
    @posts = Post.all

    @markers = @posts.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { post: post }),
        image_url: helpers.asset_url('pin.png')
      }
    end
    @featured_list = @posts.last(3)

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
                     category: params['post'][:category],
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
    @post = Post.find(params[:id])
    @post.update(title: params['post'][:title],
                 description: params['post'][:description],
                 address: params['post'][:address],
                 price: params['post'][:price],
                 category: params['post'][:category])
    @photo = Photo.new(source: params['post']['photos_attributes']['0']['source'],
                       post: @post)
    if @photo.save
      redirect_to post_path(@post.id)
    else
      redirect_to edit_post_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @booking = Booking.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def search
    @category = Post.where({ category: params[:q]})
    @search_query = params[:q]



     @markers = @category.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { post: post }),
        image_url: helpers.asset_url('pin.png')
      }
    end

  end
end



