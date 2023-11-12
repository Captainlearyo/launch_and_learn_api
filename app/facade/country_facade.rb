class CountryFacade
  def self.random_country
    all_countries = CountryService.find_all
    country = all_countries.sample
    country["name"]["common"]
  end



  def self.find_country(country_name)
    country = CountryService.search_country(country_name.downcase)
    if country[0] == nil
      nil
    else
      country[0]["name"]["common"]
    end
  end
end