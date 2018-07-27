class Api::V1::Consumer::PropertiesController < ApplicationController

	def new
		@countries = Country.select(:id, :name, :alpha3, :currency_code, :country_code, :time_zone ).all
		@chains = HotelChain.select(:id, :chain_code, :name).all
		@star_rating = StarRating.select(:id, :name).all
		@rating_source = RatingSource.select(:id, :name).all
		@timezones = TZInfo::Timezone.all_country_zones
	end
end
