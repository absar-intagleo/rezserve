class Room < ApplicationRecord
  belongs_to :block
  belongs_to :room_type
end
