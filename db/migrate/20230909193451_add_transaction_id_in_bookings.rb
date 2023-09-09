class AddTransactionIdInBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :transaction_id, :integer
  end
end
