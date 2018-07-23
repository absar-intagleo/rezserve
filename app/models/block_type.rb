class BlockType < ApplicationRecord
	has_many :blocks, dependent: :destroy
end
