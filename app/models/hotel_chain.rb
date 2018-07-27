class HotelChain < ApplicationRecord
	has_many :residential_properties, dependent: :destroy

	validates_presence_of :name
	validates_uniqueness_of :name
end
