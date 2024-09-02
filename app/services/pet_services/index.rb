class PetServices::Index
  def call
    Pet.all
  end
end
