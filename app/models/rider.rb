class Rider < ApplicationRecord
    has_one :location, class_name: "Location", foreign_key: "rider_id", dependent: :destroy
end
