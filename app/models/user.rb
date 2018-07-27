class User < ApplicationRecord
  belongs_to :user_type
  has_many :properties, dependent: :destroy

  validates_uniqueness_of :email, :scope => :user_type_id
end
