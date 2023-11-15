class VideoService 

  def self.conn
    Faraday.new(url: "https://www.googleapis.com/youtube/v3/") do |f|
      f.params[:key] = Rails.application.credentials.google[:youtube][:api_key]
      f.params[:part] = "snippet"
      f.params[:channelId] = "UCluQ5yInbeAkkeCndNnUhpw"
    end
  end

  def self.get_url(endpoint)
    response = conn.get(endpoint)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search(q)
    get_url("search?q=#{q}")
  end
end