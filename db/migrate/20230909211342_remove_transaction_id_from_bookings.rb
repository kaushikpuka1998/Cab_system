class RemoveTransactionIdFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :transaction_id, :integer
  end
end
