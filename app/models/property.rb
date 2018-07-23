class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :user
  belongs_to :country
end
