class Booking < ApplicationRecord
  before_save :set_initial_status

  belongs_to :driver
  enum status: {
    in_progress: 0,
    completed: 1,
    payment_awaited: 2,
    cab_arrived: 3,
    journey_started: 4,
    cancelled: 5
  }

  has_one :booking_transaction, class_name: 'Transaction', dependent: :destroy

  private

  def set_initial_status
    self.otp = rand(100_000..999_999)
  end
end
