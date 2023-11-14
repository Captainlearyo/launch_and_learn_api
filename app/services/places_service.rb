class PlacesService

  def conn
    Faraday.new(url: "https://api.geoapify.com/v2/") do |f|
      f.params[:apiKey] = Rails.application.credentials.geoapify[:api_key]
    end
  end

  
end