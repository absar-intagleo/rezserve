class RatingSource < ApplicationRecord
	has_many :residential_properties, dependent: :destroy
end
