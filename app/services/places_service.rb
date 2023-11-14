class PlacesService

  def self.conn
    Faraday.new(url: "https://api.geoapify.com/v2/") do |f|
      f.params[:apiKey] = Rails.application.credentials.geoapify[:api_key]
    end
  end

  def self.get_url(endpoint)
    result = conn.get(endpoint)
    JSON.parse(result.body, symbolize_names: true)
  end

  def self.find_tourist_sights(lng, lat)
    get_url("places?filter=circle:#{lng},#{lat},10000&categories=tourism.sights")
  end
  
end