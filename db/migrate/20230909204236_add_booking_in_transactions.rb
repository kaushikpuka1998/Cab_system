class AddBookingInTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :booking_id, :integer
  end
end
