class RecipeFacade
  def self.recipe_search(q)
    data = RecipeService.recipe_search(q)
    data[:hits].map do |hit|
      hit[:recipe][:country] = q
      Recipe.new(hit[:recipe])
    end
  end
end