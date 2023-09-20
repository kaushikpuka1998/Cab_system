class Driver < ApplicationRecord
  validates :name, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :licence, presence: true, uniqueness: true
  scope :available, -> { where(availability: true) }
  has_many :bookings, dependent: :destroy
  has_one :cab, dependent: :destroy
end
