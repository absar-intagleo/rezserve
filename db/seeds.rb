ROOMVIEWS = ["Beach view","Ocean view","City view","Pool view","Partial ocean view","Bay view","Canal view","Harbor view","Hill view","Lagoon view","Courtyard view","River view","Marina view","Lake view","Park view","Partial lake view","Sea view","Partial sea view","Resort view","Valley view","Vineyard view","Garden view","Golf view","Mountain view"]
ADDITIONALBEDS = ["Rollaway Bed","Crib","Sofa Bed","Day Bed"]
ROOMCLASSES = ["Basic","Business","City","Classic","Club","Comfort","Deluxe","Design","Economy","Elite","Exclusive","Executive","Family","Gallery","Grand","Honeymoon","Junior","Luxury","Panoramic","Premier","Premium","Presidential","Romantic","Royal","Senior","Signature","Standard","Superior","Traditional"]
BEDROOMDETAILS = ["1 Semi-double bed","1 Bedroom","2 Bedrooms","3 Bedrooms","4 Bedrooms","5 Bedrooms","6 Bedrooms","Multiple Bedrooms","Men only","Mixed Dorm","Women only"]
VALUEADDS = ["1 Game Drive per night","2-for-1 Buffet","2 Game Drives per night","All-Inclusive","All Meals","Breakfast Buffet","Breakfast for 1","Breakfast for 2","Casino Credit","Chain Loyalty Rate","Complimentary green fees","Continental Breakfast","Continental Breakfast for 2","Disney Park tickets","Drinks and hors doeuvres","Early Check-in","English Breakfast","Fine Hotels and Resorts","Food/Beverage Credit","Free 75CAD Gift Card","Free Airport Parking","Free Airport Shuttle","Free Breakfast","Free Dinner","Free High-Speed Internet","Free Internet","Free Lunch","Free massage included","Free minibar","Free one-way airport transfer","Free Parking","Free return airport transfer","Free Room Upgrade","Free Ski Lift Ticket & Rental","Free Valet Parking","Free water park passes","Free welcome drink","Free Wireless Internet","Full BoardFull Breakfast","Full Kitchen","Golf Credit","Half Board","Late Check-out","Match Play","Resort Credit Included","Ski pass included","Slot Play","Spa access","Spa Credit","The Hotel Collection","VIP Line Access to Nightclub(s)","Welcome Gift Upon Arrival"]

UserType::USERTYPES.each do |record_val|
  UserType.find_or_create_by!(name: record_val.downcase)
end

BedType::BEDTYPES.each do |record_val|
  BedType.find_or_create_by!(name: record_val.downcase)
end

BlockType::BLOCKTYPES.each do |record_val|
  BlockType.find_or_create_by!(name: record_val.downcase)
end

Category::CATEGORIES.each do |record_val|
  parent_category = Category.find_or_create_by!(name: record_val.downcase)
  eval("Category::#{record_val.gsub(' ', '').upcase}SUBCATEGORY").each do |sub_category|
    parent_category.sub_categories.find_or_create_by!(name: sub_category.downcase)
  end
end

PropertyType::PROPERTYTYPES.each do |record_val|
  PropertyType.find_or_create_by!(name: record_val.downcase)
end

ISO3166::Country.all.each do |country|	
	Country.find_or_create_by!(name: country.name, alpha3: country.alpha3, country_code: country.country_code, currency_code: country.currency_code, time_zone:  country.timezones.zone_info.map{|c| c.identifier}.join(",") )
  Currency.find_or_create_by!(name: country.try(:currency).try(:name), symbol: country.try(:currency).try(:symbol), iso_code: country.try(:currency).try(:iso_code) )
end

ActiveSupport::TimeZone.all.each do |tz|  #map{|tz| [, tz.utc_offset/3600]}
  TimeZone.find_or_create_by!(name: tz.name, utc_offset: tz.utc_offset )
end  

StarRating::STARRATINGS.each do |rating|
  StarRating.find_or_create_by!(name: rating)
end

RatingSource::RATINGSOURCES.each do |source|
  RatingSource.find_or_create_by!(name: source)
end

require "csv"
CSV.parse(File.read("HotelChains.csv")).each_with_index do |chain, index|
	if index > 0
		HotelChain.find_or_create_by!(name: chain.first.split("|").last, chain_code: chain.first.split("|").first)
	end
end









