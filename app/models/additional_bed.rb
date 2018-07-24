class AdditionalBed < ApplicationRecord
  belongs_to :block
  belongs_to :bed_type

  ADDITIONALBEDS = ["Rollaway Bed","Crib","Sofa Bed","Day Bed"]
end
