class BedType < ApplicationRecord
	has_many :additional_beds, dependent: :destroy
end
