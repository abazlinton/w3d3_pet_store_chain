class Pet

    attr_reader :id
    attr_accessor :name, :type, :pet_store_id

    def initialize(options)
      @id = options['id'].to_i
      @name = options['name']
      @type = options['type']
      @pet_store_id = options['pet_store_id'].to_i
    end

    def save
      sql = "INSERT INTO pets(name, type, pet_store_id) 
        VALUES(
        '#{@name}',
        '#{@type}', 
        #{@pet_store_id}) 
        RETURNING *"
      result = SqlRunner.run( sql ).first
      @id = result['id']
    end

    def store
        sql = "SELECT * from pet_stores WHERE id = #{@pet_store_id}"
        result = SqlRunner.run(sql).first
        return PetStore.new(result)
    end

    def update
      sql = "UPDATE pets SET 
        name = '#{@name}', 
        type = '#{@type}', 
        pet_store_id = '#{@pet_store_id}'  
        WHERE id = #{@id} 
        RETURNING *"
      result = SqlRunner.run(sql).first
      return Pet.new(result)
    end

    def self.all
     sql = "SELECT * FROM pets"
     result = SqlRunner.run(sql)
     return result.map {|pet| Pet.new(pet)}
    end

    def delete
      sql = "DELETE FROM pets WHERE id = #{@id}"
      result = SqlRunner.run(sql).first
      return result
    end

    def self.find(id)
      sql = "SELECT * FROM pets where id = #{id}"
      result = SqlRunner.run(sql).first
      return Pet.new(result)
    end



 
end