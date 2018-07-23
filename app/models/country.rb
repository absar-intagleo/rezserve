class Country < ApplicationRecord
	has_many :properties, dependent: :destroy
end
