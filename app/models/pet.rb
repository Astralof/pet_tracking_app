class Pet
  attr_accessor :id, :uuid, :pet_type, :tracker_type, :owner_id, :in_zone, :lost_tracker
  @@id_count = 0

  def initialize(pet_type:, tracker_type:, owner_id:, in_zone:, lost_tracker: nil)
    @id = @@id_count += 1
    @uuid = SecureRandom.uuid
    @pet_type = pet_type
    @tracker_type = tracker_type
    @owner_id = owner_id
    @in_zone = in_zone
    @lost_tracker = lost_tracker
  end

  @@pets = []

  class << self
    def all
      @@pets
    end

    def create(attributes)
      pet = new(**attributes)
      @@pets << pet
      pet
    end

    def where(query)
      @@pets.select do |pet|
        query.all? { |key, value| pet.send(key) == value }
      end
    end

    def clear
      @@pets.clear
    end
  end
end
