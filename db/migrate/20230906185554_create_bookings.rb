class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :driver_id
      t.integer :trip_id
      t.string :otp

      t.timestamps
    end
  end
end
