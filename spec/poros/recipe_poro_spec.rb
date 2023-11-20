require 'rails_helper'

RSpec.describe 'Recipe'do
describe 'Recipe Poro' do
  it 'initializes with correct attributes' do
    attr = {
      uri: "http://123",
      label: "Recipe",
      image: "images",
      country: "Italy",
      url: "http://123" # Simulating a non-nil URL
    }

    recipe = Recipe.new(attr)

    expect(recipe).to be_a(Recipe)
    expect(recipe.id).to eq(nil)

    expect(recipe.url).to eq("http://123")
    expect(recipe.title).to eq("Recipe")
    expect(recipe.image).to eq("images")
    expect(recipe.country).to eq("Italy")
  end
  end
end