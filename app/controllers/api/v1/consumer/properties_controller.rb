class Api::V1::Consumer::PropertiesController < Api::V1::Consumer::BaseController

	def new
		@countries = Country.select(:id, :name, :alpha3, :currency_code, :country_code, :time_zone).all
		@currencies = Currency.select(:id, :name, :symbol, :iso_code).all
		@chains = HotelChain.select(:id, :chain_code, :name).all
		@star_rating = StarRating.select(:id, :name).all
		@rating_source = RatingSource.select(:id, :name).all
		@timezones = TimeZone.select(:id, :name, :utc_offset).all
		@property_types = PropertyType.select(:id, :name).all
	end

	def save_property_information
		@user = User.find(params[:property]["user_id"])
		@property = @user.properties.build(property_params)
		@property.build_residential_property(resi_property_params)
		if @property.save			
			render 'save_property_information'
		else
			render json: {success: true, property: @property.errors.full_messages.join(", ")}
		end
	end

	private
	def property_params
		params[:property].permit(:name, :address_line_1, :address_line_2, :latitude, :longitude, :time_zone, :zip_code, :city, :state, :country_id, :currency_id, :time_zone_id, :property_type_id, :user_id, :facebook_link, :skype_id, :twitter_address, residential_property_attributes: [:hotel_chain_id, :star_rating_id, :rating_source_id])
	end
	def resi_property_params
		params[:property].permit(:website, :hotel_chain_id, :star_rating_id, :rating_source_id)
	end

end
