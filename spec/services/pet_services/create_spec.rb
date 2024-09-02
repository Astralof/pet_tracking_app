require 'rails_helper'

RSpec.describe PetServices::Create, type: :service do
  let(:valid_params) do
    {
      pet_type: 'Dog',
      tracker_type: 'small',
      owner_id: 1,
      in_zone: false
    }
  end

  describe '#call' do
    context 'with valid params' do
      it 'creates a pet' do
        service = PetServices::Create.new(valid_params)
        pet = service.call

        expect(pet.pet_type).to eq('Dog')
        expect(pet.tracker_type).to eq('small')
      end
    end
  end
end
