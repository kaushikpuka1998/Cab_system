class RemoveTransactionIdFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :transaction_id, :integer
  end
end
