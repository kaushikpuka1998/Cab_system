class AddBookingInTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :booking_id, :integer
  end
end
