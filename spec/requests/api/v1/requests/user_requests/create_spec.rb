require 'rails_helper'

RSpec.describe "Create User" do
    it "Happy Path creates a new user when givin correct info" do
      user = {
        "name": "John",
        "email": "yahoo.com",
        "password": "1234",
        "password_confirmation": "1234"
      }

      post "/api/v1/users", params: user, as: :json

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result).to have_key :data
      expect(result[:data]).to have_key :type
      expect(result[:data][:type]).to eq("user")
      expect(result[:data]).to have_key :id
      expect(result[:data][:id]).to_not be nil
      expect(result[:data][:attributes]).to have_key :name
      expect(result[:data][:attributes]).to have_key :email
      expect(result[:data][:attributes]).to have_key :api_key

    end

end