class MoveRatingsFromBookingsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rating, :integer
    remove_column :bookings, :rating
  end
end
