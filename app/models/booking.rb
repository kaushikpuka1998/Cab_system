class Booking < ApplicationRecord
  belongs_to :driver
  enum status: {
    in_progress: 0,
    completed: 1,
    cancelled: 2
  }
  has_one :booking_transaction, class_name: 'Transaction', dependent: :destroy
end
