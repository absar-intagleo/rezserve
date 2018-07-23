class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :user
  belongs_to :country

  has_many :taxes, dependent: :destroy
  has_many :service_fees, dependent: :destroy
  has_many :residential_properties, dependent: :destroy
  has_many :photos, as: :imageable, dependent: :destroy
  has_many :property_amenities, as: :imageable, dependent: :destroy
end
