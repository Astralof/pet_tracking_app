class PetServices::Create
  def initialize(pet_params)
    @pet_params = pet_params
  end

  def call
    return nil unless %w(Cat Dog).include?(@pet_params[:pet_type])
    Pet.create(@pet_params)
  end
end
