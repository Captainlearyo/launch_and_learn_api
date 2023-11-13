require 'rails_helper'

RSpec.describe 'Country Facade', :vcr do
  it 'should call the facade and retrieve search results' do
      search_term = 'italy'

      results = CountryFacade.find_country(search_term)

      expect(results).to be_a(String)
  end

  it 'Sad Path bad input should call the facade and retrieve search results' do
    search_term = 'neverwhere'

    results = CountryFacade.find_country(search_term)

    expect(results).to be nil
end

  it 'should return a random results' do
    search_term = 'random'

    results = CountryFacade.random_country

    expect(results).to be_a(String)
    
end
end