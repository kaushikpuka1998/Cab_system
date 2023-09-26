class Place < ApplicationRecord
  has_one :location, class_name: 'Location', foreign_key: "place_id", dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :state, presence: true
  validates :pincode, presence: true
end
