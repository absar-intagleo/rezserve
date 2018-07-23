class ResidentialProperty < ApplicationRecord
  belongs_to :property
  belongs_to :hotel_chain
  belongs_to :star_rating
  belongs_to :rating_source
end
