class ChangeStartAndEndDateToDateInBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :start_date, 'date USING CAST(start_date AS date)'
    change_column :bookings, :end_date, 'date USING CAST(end_date AS date)'
  end
end
