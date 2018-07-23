class Block < ApplicationRecord
  belongs_to :block_type
  belongs_to :residential_property
end
