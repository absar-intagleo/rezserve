class TimeZone < ApplicationRecord
	has_many :time_zones, dependent: :destroy
end
