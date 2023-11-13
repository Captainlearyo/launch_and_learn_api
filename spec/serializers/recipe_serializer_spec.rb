require 'rails_helper'

RSpec.describe 'Recipe Serializer' do
  it "returns the JSON recipe object within the serializer's format" do
    country = 'Tasty Town'
    recipe_data = {
      'recipe' => {
        'label' => 'Tres Leches',
        'uri' => 'http://example.com/recipe',
        'image' => 'http://example.com/image.jpg'
      }
    } 
    recipe = Recipe.new(recipe_data)

    serialized_recipe = RecipeSerializer.new(recipe).serializable_hash

    expected_format = {
      data: {
        id: nil,
        type: "recipe",
        attributes: {
          title: 'Tres Leches',
          url: 'http://example.com/recipe',
          country: 'Tasty Town',
          image: 'http://example.com/image.jpg'
        }
      }
    }
  end
end