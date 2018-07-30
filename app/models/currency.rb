class Currency < ApplicationRecord
	has_many :currencies, dependent: :destroy
  
end
