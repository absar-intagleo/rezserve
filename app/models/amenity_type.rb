class AmenityType < ApplicationRecord
	has_many :property_amenities, dependent: :destroy
end
