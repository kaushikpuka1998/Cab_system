class ChangeStatusToBeIntegerInBookings < ActiveRecord::Migration
  def change
    change_column :bookings, :status, :integer, using: 'status::integer'
  end
end
