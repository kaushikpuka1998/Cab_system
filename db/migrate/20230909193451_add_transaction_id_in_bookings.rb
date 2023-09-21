class AddTransactionIdInBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :transaction_id, :integer
  end
end
