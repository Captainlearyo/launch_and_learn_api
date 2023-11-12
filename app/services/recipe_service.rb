class RecipeService
  def self.conn
    Faraday.new(url: "https://api.edamam.com") do |f|
      f.params["app_id"] = Rails.application.credentials.edamam[:app_id]
      f.params["app_key"] = Rails.application.credentials.edamam[:api_key]
      f.params["type"] = "public"
    end
  end

  def self.get_url(endpoint)
    response = conn.get(endpoint)
    data = JSON.parse(response.body, symbolize_names: true)
    data
  end

  def self.recipe_search(q)
    get_url("api/recipes/v2?q=#{q}")
  end
end