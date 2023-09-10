class Location < ApplicationRecord
    belongs_to :cab, class_name: "Cab", optional: true
    belongs_to :rider, class_name: "Rider", optional: true
    validates :latitude, presence: true
    validates :longitude, presence: true

    scope :finding_fiftykm_nearest_all_cabs, -> (latitude, longitude){ 
        where("latitude <= ? 
            AND latitude >= ? 
            AND longitude <= ? 
            AND longitude >= ? 
            AND cab_id IS NOT NULL",
         latitude + 0.5, latitude - 0.5, longitude + 0.5, longitude - 0.5) 
    }


end
