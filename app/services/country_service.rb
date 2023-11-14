class CountryService
  def self.conn
    Faraday.new(url: "https://restcountries.com")
  end

  def self.get_url(endpoint)
    response = conn.get(endpoint)
    JSON.parse(response.body, symbolize_name: true)
  end

  def self.find_all
    get_url("/v3.1/all")
  end

  def self.search_country(country_name)
    get_url("/v3.1/name/#{country_name}")
  end
end