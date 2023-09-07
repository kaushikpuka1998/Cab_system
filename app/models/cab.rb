class Cab < ApplicationRecord
    belongs_to :driver
    validates :licence_number, presence: true, uniqueness: true
    validates :color, presence: true
    validates :brand, presence: true
    validates :size, presence: true
    validates :driver_id, presence:true, uniqueness: true
end
