class ResidentialProperty < ApplicationRecord
  # belongs_to :property
  belongs_to :hotel_chain, optional: true
  belongs_to :star_rating
  belongs_to :rating_source
	has_one :property, dependent: :destroy
  has_one :property_setting, dependent: :destroy
  has_many :blocks, dependent: :destroy
end
