class UserType < ApplicationRecord
	has_many :users, dependent: :destroy
  
  USERTYPES = [ "Admin","Property Owner","Consumer","Customer"]
end
