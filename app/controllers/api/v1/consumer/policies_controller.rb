class Api::V1::Consumer::PoliciesController < ApplicationController


	def new
		# @minimum_age_limits = Policy::
		@checkin_times = Policy::CHECK_IN_TIME
		@checkout_times = Policy::CHECK_OUT_TIME
		@adult_age_limits = Policy::ADULT_AGE_LIMIT
		@child_age_limits = Policy::INFANT_AGE_LIMIT
		@age_categories = Policy::AGE_CATEGORIES_LOOKUP
	end
end
