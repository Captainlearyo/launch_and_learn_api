require 'rails_helper'

RSpec.describe 'Country Service' do
    it 'searches our API for a country', :vcr  do
      search_term = 'germany'

      response = CountryService.search_country(search_term)

      expect(response).to be_a(Array)
      expect(response[0]).to have_key('name')
      expect(response[0]['name']).to have_key('common')
      expect(response[0]['name']['common']).to eq("Germany")
  end
end