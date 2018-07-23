class PropertyAmenity < ApplicationRecord
  belongs_to :amenity
  belongs_to :amenity_type
end
