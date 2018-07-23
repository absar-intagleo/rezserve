class PropertyAmenity < ApplicationRecord
  belongs_to :amenity
  belongs_to :amenity_type
  belongs_to :ameniable, polymorphic: true
end
