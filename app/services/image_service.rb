class ImageService

  def self.conn
    Faraday.new(url: "https://api.unsplash.com/") do |f|
      f.params[:client_id] = Rails.application.credentials.unsplash[:api_key]
    end
  end

  def self.get_url(endpoint)
    response = conn.get(endpoint)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search(q)
    get_url("search/photos?query=#{q}")
  end
end