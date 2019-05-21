class AddPostReferenceToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :post, foreign_key: true
  end
end
