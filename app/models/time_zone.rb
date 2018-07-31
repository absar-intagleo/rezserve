class TimeZone < ApplicationRecord
	has_many :properties, dependent: :destroy
end
