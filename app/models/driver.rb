class Driver < ApplicationRecord
    scope :available, -> { where(availability: true) }
    has_many :bookings, dependent: :destroy
end
