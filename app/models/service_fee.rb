class ServiceFee < ApplicationRecord
  belongs_to :property

  FEES_ENTITIES = ['parking', 'pet', 'resort', 'cleaning']
  FEES_VALUES = {'parking' => 'Parking Fee', 'pet' => 'Pet Fee', 'resort' => 'Resort Fee', 'cleaning' => 'Clean Fee'}

  def self.tax_value(key)
    FEES_VALUES[key]
  end
end
