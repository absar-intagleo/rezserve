class Tax < ApplicationRecord
  belongs_to :property

 	TAX_ENTITIES = ['sales_tax', 'federal_tax']
  TAX_VALUES = { 'sales_tax' => 'Sales Tax', 'federal_tax' => 'Federal Tax' }
  def self.tax_value(key)
    TAX_VALUES[key]
  end

 
end
