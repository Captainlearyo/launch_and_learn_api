require 'rails_helper'

RSpec.describe 'Learning Resources'do
describe 'Learning Resources' do
  xit 'initializes with correct attributes' do
    
      q = "Italy"
      video = "video"
      images = "images"
    

    learning_resource = LearningResource.new(video, images, q)

    binding.pry
    expect(learning_resource).to be_a(LearningResource)
    expect(learning_resource.id).to eq(nil)

    expect(learning_resource.country).to eq("Italy")
    expect(learning_resource.video).to eq("video")
    expect(learning_resource.images).to eq("images")
  end
  end
end