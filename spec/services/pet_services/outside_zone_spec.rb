require 'rails_helper'

RSpec.describe PetServices::OutsideZone, type: :service do
  let(:out_of_zone) do
    {
      pet_type: 'Dog',
      tracker_type: 'small',
      owner_id: 1,
      in_zone: false
    }
  end

  let(:in_of_zone) do
    {
      pet_type: 'Dog',
      tracker_type: 'small',
      owner_id: 1,
      in_zone: true
    }
  end

  describe '#call' do
    context 'with valid params' do
      it 'creates a pet' do
        3.times do
          PetServices::Create.new(out_of_zone).call
        end
        3.times do
          PetServices::Create.new(in_of_zone).call
        end
        service = PetServices::OutsideZone.new
        pets = service.call
        expect(pets.count).to eq(3)
        pets.each do |pet|
          expect(pet.pet_type).to eq('Dog')
          expect(pet.tracker_type).to eq('small')
          expect(pet.in_zone).to eq(false)
        end
      end
    end
  end
end
