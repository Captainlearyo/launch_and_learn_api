class TouristSightsFacade
  def self.find_sights(country_name)
    response = CountryService.search_country(country_name)
    if response.is_a?(Array) && !response.empty?
      latlng = response[0]['capitalInfo']['latlng']
      tourist_sights = PlacesService.find_tourist_sights(latlng[1], latlng[0])
      tourist_sights[:features].map do |sight|
        TouristSight.new(sight)
      end
      
    else
      return nil
    end
  end
end
