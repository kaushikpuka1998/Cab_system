class Location < ApplicationRecord
    belongs_to :cab, class_name: "Cab"
    validates :latitude, presence: true
    validates :longitude, presence: true
    validates :locator_id, presence: true
    validates :locator_id, uniqueness: true
end
