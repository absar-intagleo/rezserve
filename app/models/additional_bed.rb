class AdditionalBed < ApplicationRecord
  belongs_to :block
  belongs_to :bed_type
end
