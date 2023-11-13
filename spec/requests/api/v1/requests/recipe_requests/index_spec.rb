require 'rails_helper'

RSpec.describe 'Recipe Index', type: :request do 

  it 'Happy Path Searches for Recipes by country', :vcr do

    get "/api/v1/recipes?country=mexico"

    expect(response).to be_successful
    
    json_response = JSON.parse(response.body, symbolize_names: true)
    
    expect(json_response).to be_an(Hash)


    expect(json_response[:data][0][:attributes]).to have_key :title
    expect(json_response[:data][0][:attributes]).to have_key :country
  end

  xit 'Happy Path Searches for random Country Recipes', :vcr  do
    #does not work with vcr
    get "/api/v1/recipes?country=random"

    expect(response).to be_successful
    
    json_response = JSON.parse(response.body, symbolize_names: true)
    
    expect(json_response).to be_an(Hash)

    expect(json_response[:data][0][:attributes]).to have_key :title
    expect(json_response[:data][0][:attributes]).to have_key :country

  end
  
end