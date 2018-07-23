class Imageable < ApplicationRecord
  belongs_to :block, polymorphic: true
  belongs_to :property, polymorphic: true
  belongs_to :category
end
