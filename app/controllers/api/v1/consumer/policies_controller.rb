	class Api::V1::Consumer::PoliciesController < ApplicationController


	def new
		@age_categories_lookup = Policy::AGE_CATEGORIES_LOOKUP
  	@cancellation_period_lookup = Policy::CANCELLATION_PERIOD_LOOKUP
	  @cancellation_policy_lookup = Policy::CANCELLATION_POLICY_LOOKUP
	  @smoking_policies_lookup = Policy::SMOKING_POLICIES_LOOKUP
 	 	@room_rate_unit_lookup = Policy::ROOM_RATE_UNITS_LOOKUP
		@parking_policies_lookup = Policy::PARKING_POLICIES_LOOKUP
		@parking_rate_units_lookup = Policy::PARKING_RATE_UNITS_LOOKUP
		@pet_policies_lookup = Policy::PET_POLICIES_LOOKUP
	end

	def create
		@property = Property.find(params[:property_id])
		if @property.present?
			@policy = @property.policy

		else
			render json: { success: false, message: 'Property not Found'}
		end
	end

	private
	def policy_params
		params[:policy].permit(:)
	end
end