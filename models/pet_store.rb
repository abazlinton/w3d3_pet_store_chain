require_relative '../db/sql_runner'
require_relative 'pet'


class PetStore

  attr_reader :id
  attr_accessor :name, :address, :stock_type

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
    @stock_type = options['stock_type']
  end


  def save
    sql = "INSERT INTO pet_stores(name, address, stock_type) 
      VALUES(
      '#{@name}',
      '#{@address}',
      '#{@stock_type}') 
      RETURNING *"
    result = SqlRunner.run(sql).first
    @id = result['id']
    
  end

  def update
    sql = "UPDATE pet_stores SET 
      name = '#{@name}', 
      address = '#{@address}',
      stock_type = '#{@stock_type}'
      WHERE id = #{@id} RETURNING *"
    result = SqlRunner.run(sql).first
    return PetStore.new(result)
  end

  def delete
    sql = "DELETE FROM pet_stores WHERE id = #{@id}"
    result = SqlRunner.run(sql)
    return result
  end


  def pets
    sql = "SELECT * FROM pets WHERE pet_store_id = #{@id}"
    result = SqlRunner.run(sql)
    return result.map {|pet| Pet.new(pet)}

  end

  def self.all
   sql = "SELECT * FROM pet_stores"
   result = SqlRunner.run(sql)
   return result.map {|store| PetStore.new(store)}
  end

  def self.find(store_id)
    sql = "SELECT * FROM pet_stores WHERE id = #{store_id}"
    result = SqlRunner.run(sql).first
    return PetStore.new(result)
  end

  

 

  
  










end