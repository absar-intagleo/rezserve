class ServiceFee < ApplicationRecord
  belongs_to :property

  FEES_ENTITIES = ['parking_fees', 'pet_fees', 'resort_fees', 'cleaning_fee']
  FEES_VALUES = {'parking_fees' => 'Parking Fee', 'pet_fees' => 'Pet Fee', 'resort_fees' => 'Resort Fee', 'cleaning_fee' => 'Clean Fee'}

  def self.tax_value(key)
    FEES_VALUES[key]
  end
end
