class Recipe
  attr_reader :url, :title, :image, :country, :id
  def initialize(recipe_data)
    @id = nil
    @url = recipe_data[:uri]
    @title = recipe_data[:label]
    @image = recipe_data[:image]
    @country = recipe_data[:country] #recipe_data[:cuisineType] 
  end
end
