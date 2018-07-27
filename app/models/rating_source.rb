class RatingSource < ApplicationRecord
	has_many :residential_properties, dependent: :destroy
	RATINGSOURCES = ["National Ratings"]
end
