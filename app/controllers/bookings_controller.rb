class BookingsController < ApplicationController
  def index
    # @posts = Post.where("user_id = #{current_user.id}")

    if params['show'].present? && params['show'] == 'listings'
      @posts = Post.where("user_id = #{current_user.id}")

    elsif params['show'].present? && params['show'] == 'requested'
      status = %w[requested]
      @bookings = Booking.where(user_id: current_user, status: status)

    elsif params['show'].present? && params['show'] == 'completed'
      status = %w[completed returned]
      @bookings = Booking.where(user_id: current_user, status: status)

    elsif params['show'].nil? || params['show'] == 'active'
      status = %w[confirmed requested payed picked_up]
      @bookings = Booking.where(user_id: current_user, status: status)

    elsif params['show'].nil? || params['show'] == 'rejected'
      status = %w[rejected cancelled]
      @bookings = Booking.where(user_id: current_user, status: status)

    elsif params['show'].nil? || params['show'] == 'all'
      @bookings = Booking.where(user_id: current_user)

    elsif params['show'].nil? || params['show'] == 'profile'
      @bookings = ''
      @posts = ''
      @profile = true
    end

  end

  def new
    # Provide empty booking object for the form
    @booking = Booking.new
    # Find the relevant post thru the params for the form
    @post = Post.find(params['post_id'])
  end

  def create
    # Find the post using the params
    @post = Post.find(params['post_id'])
    # Creates a booking object with the params from the form
    # Also requires and permits (see private method below)
    @booking = Booking.new(booking_params)
    # sets the default status as requsted
    @booking.status = 'requested'
    # assigns the current user as the user of the booking
    @booking.user = current_user

    # Assign the post to the booking
    @booking.post = @post

    if @booking.save
      @booking.price = (@booking.end_date - @booking.start_date).to_i * @post.price.to_i
      @booking.save
      redirect_to booking_path(@booking)
    else
      render 'posts/show'
    end
  end

  def show
    # Find the booking using the params

    @booking = Booking.find(params['id'])
    @post = @booking.post
    @markers =
      [{
        lat: @post.latitude,
        lng: @post.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { post: @post }),
        image_url: helpers.asset_url('pin.png')
      }]
    end

  def edit
  end

  def update
    @booking = Booking.find(params['id'])
    @booking.status = 'payed'
    @booking.save!
    redirect_to booking_path(@booking)
  end

  def payment
    @booking = Booking.find(params['id'])
    @post = @booking.post
  end

  def confirm
    @booking = Booking.find(params['id'])
    @booking.status = 'confirmed'
    @booking.save
    redirect_to booking_path(@booking)
  end


  private

  def booking_params
    params.require('booking').permit('start_date', 'end_date', 'rating')
  end
end
