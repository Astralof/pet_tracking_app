class PetServices::OutsideZone
  def call
    Pet.where(in_zone: false)
  end
end
