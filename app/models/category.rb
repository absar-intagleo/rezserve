class Category < ApplicationRecord
	has_many :additional_beds, dependent: :destroy
	has_many :sub_categories, class_name: "Category",
                          foreign_key: "sub_category_id"
 
  belongs_to :category, class_name: "Category"
end
