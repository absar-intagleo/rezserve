class ApplicationController < ActionController::API


	# before_action :validate_api_secret

	# private

	# def validate_api_key
	# 	unless params["apiKey"].present? && (ActiveSupport::SecurityUtils.secure_compare(ENV['HOTELS_SITE_API_KEY'],params["apiKey"])
 #      response = params["apiKey"].present? ? {"error": "Invalid Authentication" } : {"error": "Missing parameter: ApiKey" } 
	# 		render(json: response.to_json, status: 401) and return
	# 	end
	# end

	# def validate_api_secret
	# 	unless params["secretKey"].present? && (ActiveSupport::SecurityUtils.secure_compare(ENV['HOTELS_SITE_SECRET_KEY'],params["secretKey"])
 #      response = params["secretKey"].present? ? {"error": "Invalid Authentication" } : {"error": "Missing parameter: secretKey" } 
	# 		render(json: response.to_json, status: 401) and return
	# 	end
	# end

end
