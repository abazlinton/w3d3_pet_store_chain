require_relative './models/pet_store'
require_relative './models/pet'
require 'pry-byebug'



`psql -d pet_store_chain -f ./db/pet_store_chain.sql`

store_1 = PetStore.new({'name' => "Petes Pets", 'address' => "37 Castle Terrace", 'stock_type' => "exotic"})

store_1.save



pet_1 = Pet.new({'name' => "Sid", 'type' => "snake", 'pet_store_id' => store_1.id})

pet_1.save

puts PetStore.all(1)

puts pet_1.store

puts PetStore.find(1)

pet_1 = Pet.update_pet_name(pet_1, "John")


binding.pry
nil