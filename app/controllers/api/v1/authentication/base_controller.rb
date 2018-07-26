class Api::V1::Authentication::BaseController < ApplicationController

	before_action :validate_api_key

	private

	def validate_api_key
		unless params["api_key"].present? && (ActiveSupport::SecurityUtils.secure_compare(ENV['HOTELS_SITE_API_KEY'],params["api_key"]))
      response = params["api_key"].present? ? "Invalid Authentication" :  "Missing parameter api_key"  
			render(json: {success: false, message: response, status: 401}) and return
		end
	end	
end
