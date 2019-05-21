class BookingsController < ApplicationController

  def index
    @bookings = Booking.where("user_id = #{current_user.id}")
    @posts = Post.where("user_id = #{current_user.id}")
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

    # ASSIGN THE PRICE (Number of days time the price specified in post)
    @booking.price = (@booking.end_date - @booking.start_date).to_i * @post.price.to_i

    # Assign the post to the booking
    @booking.post = @post

    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end

  end

  def edit
  end

  def update
  end

  private

  def booking_params
    params.require('booking').permit('start_date', 'end_date')
  end
end
