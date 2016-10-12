require_relative '../db/sql_runner'
require_relative 'pet'


class PetStore

  attr_reader :id, :name, :address, :stock_type

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
    @stock_type = options['stock_type']
  end


  def save
    sql = "INSERT INTO pet_stores(name, address, stock_type) VALUES('#{@name}','#{@address}','#{@stock_type}') RETURNING *"
    result = SqlRunner.run(sql).first
    @id = result['id']
    
  end

  def self.all(store_id)
    sql = "SELECT * FROM pets WHERE pet_store_id = #{store_id}"
    result = SqlRunner.run(sql)
    return result.map {|pet| Pet.new(pet)}

  end

  def self.find(store_id)
    sql = "SELECT * FROM pet_stores WHERE id = #{store_id}"
    result = SqlRunner.run(sql).first
    return PetStore.new(result)
  end

  










end