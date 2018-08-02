class Policy < ApplicationRecord
  belongs_to :property

  MINIMUM_AGE_LIMIT = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22]
  CHECK_IN_TIME = ['0100', '0200', '0300', '0400', '0500', '0600', '0700', '0800', '0900', '1000', '1100' , '1200', '1300', '1400', '1500', '1600', '1700', '1800', '1900', '2000', '2100', '2200', '2300']
  AGE_CATEGORIES = ['Adults Only', 'Adults and Children']
  ADULT_AGE_LIMIT = [15, 16, 17, 18, 19]
  INFANT_AGE_LIMIT = [1, 2]
  AGE_CATEGORIES_LOOKUP = { :adults_only => 'Adults Only', :adults_and_children => 'Adults and Children'}
end
