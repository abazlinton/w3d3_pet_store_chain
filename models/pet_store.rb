require_relative '../db/sql_runner'


class PetStore

  attr_reader :id, :name, :address, :stock_type

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @address = options['address']
    @stock_type = options['stock_type']
  end


  def save
    sql = "INSERT INTO pet_stores(name, address, stock_type) VALUES('#{@name}','#{@address}','#{@stock_type}') RETURNING *"
    result = SqlRunner.run(sql).first
    @id = result['id']
    
  end










end