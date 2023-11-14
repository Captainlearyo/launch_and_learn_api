require 'rails_helper'

RSpec.describe 'sights'do
describe 'TouristSight Poro' do
  xit 'initializes with correct attributes' do
    attr = {
      name: "a place",
      address: "on a road",
      place_id: "1234"
    }

    sight = TouristSight.new(attr)
    

    expect(sight).to be_a(TouristSight)
    expect(sight.id).to eq(nil)

    expect(sight.name).to eq("a place")
    expect(sight.address).to eq("on a road")
    expect(sight.place_id).to eq("1234")
  end
  end
end