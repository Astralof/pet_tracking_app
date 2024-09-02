require 'rails_helper'

RSpec.describe 'Pets API', type: :request do
  describe 'POST /pets' do
    it 'creates a pet' do
      post '/pets', params: { pet: { pet_type: 'Dog', tracker_type: 'small', owner_id: 1, in_zone: false } }

      expect(response).to have_http_status(:created)
      data = JSON.parse(response.body)["data"]
      expect(data["uuid"].present?).to be true
      expect(data["type"]).to eq("pets")
      expect(data["attributes"]["pet_type"]).to eq('Dog')
    end

    context "wrong pet type" do
      it 'creates a pet' do
        post '/pets', params: { pet: { pet_type: 'abc', tracker_type: 'small', owner_id: 1, in_zone: false } }
  
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /pets' do
    it 'retrieves all pets' do
      get '/pets'

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /pets/outside_zone' do
    it 'retrieves pets outside of the power-saving zone' do
      post '/pets', params: { pet: { pet_type: 'Dog', tracker_type: 'small', owner_id: 1, in_zone: false } }

      get '/pets/outside_zone'
      expect(response).to have_http_status(:ok)
      JSON.parse(response.body)["data"].each do |data|
        expect(data["uuid"].present?).to be true
        expect(data["type"]).to eq("pets")
        expect(data["attributes"]["pet_type"]).to eq('Dog')
      end
    end
  end
end
