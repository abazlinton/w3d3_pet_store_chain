require_relative './models/pet_store'
require_relative './models/pet'
require 'pry-byebug'
require 'pp'



`psql -d pet_store_chain -f ./db/pet_store_chain.sql`

store_1 = PetStore.new({'name' => "Petes Pets", 'address' => "37 Castle Terrace", 'stock_type' => "exotic"})
store_1.save

store_2 = PetStore.new({'name' => "Alex''s Animals", 'address' => "Cannonmills", 'stock_type' => "anything"})
store_2.save

pet_1 = Pet.new({'name' => "Sid", 'type' => "snake", 'pet_store_id' => store_1.id})
pet_1.save

pet_2 = Pet.new({'name' => "George", 'type' => "girafe", 'pet_store_id' => store_1.id})
pet_2.save


puts "\nALL PETS\n"
pp Pet.all

puts "\nSTORE 1 PETS\n"
pp store_1.pets

puts "\nSTORE 1\n"
pp pet_1.store

puts "\nFIND STORE 2\n"
pp PetStore.find(2)

puts "\nCHANGE PET 1 name\n"
pet_1.name ="Changed"
pp pet_1.update

puts "\nDELETED PET 2\n"
pet_2.delete
pp Pet.all

puts "\nFOUND PET 1\n"
pp Pet.find(1)

puts "\nCHANGE STORE 1 name\n"
store_1.name ="Changed"
pp store_1.update

puts "\nALL STORES\n"
pp PetStore.all

puts "\nDELETED STORE 2\n"
store_2.delete
pp PetStore.all



binding.pry
nil