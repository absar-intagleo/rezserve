class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :user
  belongs_to :country
  belongs_to :currency
  belongs_to :time_zone
  
  has_many :taxes, dependent: :destroy
  has_many :service_fees, dependent: :destroy
  has_many :photos, as: :imageable, dependent: :destroy
  has_many :property_amenities, as: :imageable, dependent: :destroy
  has_one :residential_property, dependent: :destroy
  
end
