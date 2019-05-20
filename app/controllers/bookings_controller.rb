class BookingsController < ApplicationController
  def index
  end

  def new
    # Provide empty booking object for the form
    @booking = Booking.new
    # Find the relevant post thru the params for the form
    @post = Post.find(params['post_id'])

  end

  def create
    # Creates a booking object with the params from the form
    # Also requires and permits (see private method below)
    @booking = Booking.new(booking_params)
    # sets the default status as requsted
    @booking.status = 'requested'
    # assigns the current user as the user of the booking
    @booking.user = current_user

    # ASSIGN THE PRICE
    @booking.price = 250

    # Find the post using the params
    @post = Post.find(params['post_id'])

    # Assign the post to the booking

    raise


    # add if validation if @booking.save
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
