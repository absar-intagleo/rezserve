class Api::V1::Consumer::PropertiesController < Api::V1::Consumer::BaseController

	def new
		@currencies = Currency.select(:id, :name, :symbol, :iso_code).all.order(:name)
		@chains = HotelChain.select(:id, :chain_code, :name).all.order(:name)
		@star_rating = StarRating.select(:id, :name).all.order(:name)
		@rating_source = RatingSource.select(:id, :name).all.order(:name)
		@timezones = TimeZone.select(:id, :name, :utc_offset).all.order(:utc_offset)
		@property_types = PropertyType.select(:id, :name).all.order(:name)
	end

	def save_property_information
		@user = User.find_by_dt_uuid(params[:dt_uuid])
		@property = @user.properties.build(property_params)
		@property.build_residential_property(resi_property_params)
		if @property.save			
			render 'save_property_information'
		else
			render json: {success: true, message: @property.errors.full_messages.join(", ")}
		end
	end

	def show
		@property = Property.find(params[:property_id])
		if @property.present?			
			render 'save_property_information'
		else
			render json: {success: true, message: 'Property not Found'}
		end
	end

	private
	def property_params
		params[:property].permit(:name, :address, :latitude, :longitude, :time_zone, :zip_code, :city, :state, :currency_id, :time_zone_id, :property_type_id, :user_id, :facebook_address, :skype_address, :twitter_address, :country)
	end

	def resi_property_params
		resi_params = { 
				hotel_chain_id: params[:hotel_chain_id],
				star_rating_id: params[:star_rating_id],
				rating_source_id: params[:rating_source_id],
				website: params[:website]
			}
		resi_params	
	end

	 
end
