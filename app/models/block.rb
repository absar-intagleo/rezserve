class Block < ApplicationRecord
  belongs_to :block_type
  belongs_to :residential_property

  has_many :additional_beds, dependent: :destroy
	has_many :rooms, dependent: :destroy
	has_many :cancellation_policies, dependent: :destroy
	has_many :imageables, dependent: :destroy
	has_many :photos, as: :imageable, dependent: :destroy
	has_many :property_amenities, as: :imageable, dependent: :destroy
	has_many :bookings, dependent: :destroy
	
	has_one :availability, dependent: :destroy

end
