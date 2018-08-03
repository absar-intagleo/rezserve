class Api::V1::Consumer::SettingsController < ApplicationController

	
	def new
		@minimum_age_limits = Policy::MINIMUM_AGE_LIMIT
		@checkin_out_times = Policy::CHECK_IN_TIME
		@adult_age_limits = Policy::ADULT_AGE_LIMIT
		@child_age_limits = Policy::INFANT_AGE_LIMIT
		@age_categories = Policy::AGE_CATEGORIES_LOOKUP
	end

	def create
		@property = Property.find(params[:property_id])
		if @property.present?
			@policy = @property.policy
			if @policy.update(setting_params)
				render json: {success: true, message: 'Property Settings have been added successfully'}
			else
				render json: {success: false, message: @policy.errors.full_messages.join(', ')} 
			end
		else
			render json: {success: false, message: 'Property not Found'}
		end
	end

	private
	def setting_params
		params[:setting].permit(:minimum_age_limt, :check_in_time, :check_out_time, :age_category, :adult_age_limit, :infant_age_limit, :special_instruction, :property_id)
	end
end
