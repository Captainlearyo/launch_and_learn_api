require 'rails_helper'

RSpec.describe 'Favorites Create', type: :request do 

  it 'Happy Path creates favorite recipe in DB', :vcr do

    user = User.create(name:"bobby", email: "hill@king.com", password: "1234", password_confirmation: "1234")

      data = {
        "api_key": "#{user.api_key}",
        "country": "thailand",
        "recipe_link": "https://www.tastingtable.com/.....",
        "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
      }

      post "/api/v1/favorites", params: data, as: :json
      expect(response).to be_successful
      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response[:success]).to eq("Favorite added successfully")
  end

  it "returns an error if the given API key does not match a user" do
    user = User.create(name:"bobby", email: "hill@king.com", password: "1234", password_confirmation: "1234")

    data = {
      "api_key": "1234",
      "country": "thailand",
      "recipe_link": "https://www.tastingtable.com/.....",
      "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
    }

    post "/api/v1/favorites", params: data, as: :json

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:error]).to eq("No user found for api_key")
  end
end