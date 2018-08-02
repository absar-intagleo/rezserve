class Api::V1::Consumer::SettingsController < ApplicationController

	
	def new
		@minimum_age_limits = Policy::MINIMUM_AGE_LIMIT
		@checkin_out_times = Policy::CHECK_IN_TIME
		@adult_age_limits = Policy::ADULT_AGE_LIMIT
		@child_age_limits = Policy::INFANT_AGE_LIMIT
		@age_categories = Policy::AGE_CATEGORIES_LOOKUP
	end

end
