require 'rails_helper'

RSpec.describe 'Favorites Index', type: :request do 

  it 'Happy Path returns a list of the users favorited recipes', :vcr do

    bobby = User.create(name:"bobby", email: "hill@king.com", password: "1234", password_confirmation: "1234")

    Favorite.create(country: "place", recipe_link: "linky", recipe_title: "food stuff", user_id: bobby.id)

    get "/api/v1/favorites?api_key=#{bobby.api_key}"

    expect(response).to be_successful
    
    json_response = JSON.parse(response.body, symbolize_names: true)
    
    expect(json_response).to be_an(Hash)


    expect(json_response).to have_key :data
    expect(json_response[:data]).to be_an Array
    expect(json_response[:data].first).to have_key :id
    expect(json_response[:data].first).to have_key :type
    expect(json_response[:data].first[:type]).to eq("favorite")
    expect(json_response[:data].first).to have_key :attributes
    expect(json_response[:data].first[:attributes]).to have_key :recipe_title
    expect(json_response[:data].first[:attributes]).to have_key :recipe_link
    expect(json_response[:data].first[:attributes]).to have_key :country
    expect(json_response[:data].first[:attributes]).to have_key :created_at
  end
end