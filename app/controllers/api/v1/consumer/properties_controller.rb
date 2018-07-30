class Api::V1::Consumer::PropertiesController < ApplicationController

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
		@property = Property.new(property_params)
		if @property.save
			render json: {success: true, property: @property}
		else
			render json: {success: true, property: @property.errors.full_messages.join(", ")}
		end
	end

	private

	def property_params
		params[:property].permit(:name, :address_line_1, :address_line_2, :latitude, :longitude, :time_zone, :zip_code, :city, :state, :country_id, :currency_id, :time_zone_id, :property_type_id, :hotel_chain_idm, :star_rating_id, :rating_source_id, :user_id, :facebook_link, :skype_id, :twitter_address)
	end
end
