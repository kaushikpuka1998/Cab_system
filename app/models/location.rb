class Location < ApplicationRecord
  belongs_to :cab, class_name: "Cab", optional: true
  belongs_to :rider, class_name: "Rider", optional: true
  belongs_to :place, class_name: "Place", optional: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  scope :finding_fiftykm_nearest_all_cabs, lambda { |latitude, longitude, clat, clong, cab_type|
    joins("JOIN cabs ON cabs.id = locations.cab_id")
      .where("latitude <= ?
             AND latitude >= ?
             AND longitude <= ?
             AND longitude >= ?
             AND cab_id IS NOT NULL
             AND cabs.availability = true
             AND cabs.brand = ?",
             Arel.sql((latitude + 0.5).to_s), Arel.sql((latitude - 0.5).to_s), Arel.sql((longitude + 0.5).to_s),
             Arel.sql((longitude - 0.5).to_s), cab_type)
      .order(Arel.sql("((#{clat} - #{latitude}) * (#{clat} - #{latitude})) +
       ((#{clong} - #{longitude}) * (#{clong} - #{longitude})) ASC"))
      .limit(10)
  }

  scope :finding_fiftykm_nearest_cab, lambda { |latitude, longitude, clat, clong, cab_type|
    joins("JOIN cabs ON cabs.id = locations.cab_id")
      .where("latitude <= ?
             AND latitude >= ?
             AND longitude <= ?
             AND longitude >= ?
             AND cab_id IS NOT NULL
             AND cabs.availability = true
             AND cabs.brand = ?",
             Arel.sql((latitude + 0.5).to_s), Arel.sql((latitude - 0.5).to_s), Arel.sql((longitude + 0.5).to_s),
             Arel.sql((longitude - 0.5).to_s), cab_type)
      .order(Arel.sql("((#{clat} - #{latitude}) * (#{clat} - #{latitude})) +
       ((#{clong} - #{longitude}) * (#{clong} - #{longitude})) ASC"))
      .limit(1)
  }
end
