class Transaction < ApplicationRecord
    belongs_to :booking, class_name: 'Booking'
    enum :status, [:SUCCESS, :FAILED,:NOT_STARTED], default: :NOT_STARTED

    scope :select_day_earning, ->(id = nil) {
        joins(:booking).where("bookings.driver_id = ? AND transactions.created_at >= ? AND transactions.created_at <= ?", id, Time.now.beginning_of_day, Time.now.end_of_day)
                       .sum(:amount)    
      }
end
