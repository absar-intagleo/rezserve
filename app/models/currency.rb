class Currency < ApplicationRecord
	has_many :properties, dependent: :destroy
  
end
