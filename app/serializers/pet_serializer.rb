class PetSerializer
  def initialize(pets)
    @pets = pets
  end

  def as_json
    if @pets.is_a?(Array)
      serialize_collection(@pets)
    else
      serialize_single(@pets)
    end
  end

  private

  def serialize_single(pet)
    {
      data: data(pet)
    }
  end

  def serialize_collection(pets)
    {
      data: pets.map do |pet|
        data(pet)
      end,
      meta: {
        count: pets.count
      }
    }
  end

  def data(pet)
    {
      uuid: pet.uuid,
      type: "pets",
      attributes: {
        pet_type: pet.pet_type,
        tracker_type: pet.tracker_type,
        owner_id: pet.owner_id,
        in_zone: pet.in_zone,
        lost_tracker: pet.lost_tracker
      }
    }
  end
end
