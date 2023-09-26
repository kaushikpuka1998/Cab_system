class AdditionRiderIdColumnBookingTable < ActiveRecord::Migration
  def change
    add_column :bookings, :rider_id, :integer
    add_index :bookings, :rider_id
    remove_column :bookings, :trip_id
  end
end
