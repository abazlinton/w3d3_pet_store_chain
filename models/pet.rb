class Pet

    attr_reader :id, :name, :type, :pet_store_id

    def initialize(options)
      @id = options['id'].to_i
      @name = options['name']
      @type = options['type']
      @pet_store_id = options['pet_store_id'].to_i
    end

    def save
      sql = "INSERT INTO pets(name, type, pet_store_id) VALUES('#{@name}','#{@type}', #{@pet_store_id}) RETURNING *"
      result = SqlRunner.run( sql ).first
      @id = result['id']
    end

    def store
        sql = "SELECT * from pet_stores WHERE id = #{@pet_store_id}"
        result = SqlRunner.run(sql).first
        return PetStore.new(result)
    end

    def self.update_pet_name(pet, name)
      sql = "UPDATE pets SET name = '#{name}' WHERE id = #{pet.id} RETURNING *"
      result = SqlRunner.run(sql).first
      return Pet.new(result)
    end



end