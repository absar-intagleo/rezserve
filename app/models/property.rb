class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :user
  belongs_to :currency
  belongs_to :time_zone
  belongs_to :residential_property

  has_one :policy, dependent: :destroy
  has_many :taxes, dependent: :destroy
  has_many :service_fees, dependent: :destroy
  has_many :photos, as: :imageable, dependent: :destroy
  has_many :property_amenities, as: :ameniable, dependent: :destroy

  accepts_nested_attributes_for :policy, allow_destroy: true
  accepts_nested_attributes_for :taxes, allow_destroy: true
  accepts_nested_attributes_for :service_fees, allow_destroy: true
  
  
end
