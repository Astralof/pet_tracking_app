class PetsController < ApplicationController
  # only to make it simple
  skip_before_action :verify_authenticity_token

  def create
    pet = PetServices::Create.new(pet_params).call
    if pet
      render json: PetSerializer.new(pet).as_json, status: :created
    else
      render json: { error: 'Failed to receive pet data' }, status: :unprocessable_entity
    end
  end

  def index
    render json: PetSerializer.new(PetServices::Index.new.call).as_json, status: :ok
  end

  def outside_zone
    pets = PetServices::OutsideZone.new.call
    render json: PetSerializer.new(pets).as_json, status: :ok
  end

  private

  def pet_params
    puts params
    params.require(:pet).permit(:pet_type, :tracker_type, :owner_id, :in_zone, :lost_tracker).to_h.symbolize_keys
  end
end
