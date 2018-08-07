class Tax < ApplicationRecord
  belongs_to :property

 	TAX_ENTITIES = ['state_tax', 'federal_tax']
  TAX_VALUES = { 'state_tax' => 'State Tax', 'federal_tax' => 'Federal Tax' }
  def self.tax_value(key)
    TAX_VALUES[key]
  end

 
end
