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
    @featured_list = @posts.first(3)
    @camping_gear_list = Post.where(category: "camping gear").last(3)
    @outdoor_equipment_list = Post.where(category: "outdoor equipment").last(3)
  end

  def new
    @post = Post.new
    @post.photos.build
  end

  def create
    @post = Post.new(post_strong_params)
    @post.update(user: current_user)
    params['post']['photos_attributes']['0']['source'].each do |source|
      @post.photos.new(source: source)
    end
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_strong_params)
    @post.update(user: current_user)

    params['post']['photos_attributes'].each do |index, value|
      if value.key?(:source)
        photo = Photo.find(value[:id])
        photo.source = value[:source]
        photo.save
      end
    end

    # @photo = Photo.new(source: params['post']['photos_attributes']['0']['source'],
    #                    post: @post)
    if @post.save!
      redirect_to post_path(@post.id)
    else
      render :edit
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
    if params[:q].present?
      @result = Post.search_by_title_description_category(params[:q])
      @markers = markers(@result)

      display_all if @markers == []
    else
      display_all
    end
  end

  private

  def post_strong_params
    params.require(:post).permit(:title, :description, :address, :price, :category)
  end

  # Displays all the post in the database if query was not found
  def display_all
    @result = Post.all
    @markers = markers(@result)
  end

  # Gets the markers for the map
  def markers(result)
    markers = result.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { post: post }),
        image_url: helpers.asset_url('pin.png')
      }
    end
    return markers
  end
end
