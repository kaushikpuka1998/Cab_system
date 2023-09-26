class AdditionRiderIdColumnBookingTable < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :rider_id, :integer
    add_index :bookings, :rider_id
    remove_column :bookings, :trip_id
  end
end
