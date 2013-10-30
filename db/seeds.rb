me = User.create(name: 'Grant', contact_number: '080 990 9987', email: 'grant@spam.com', password: "111111", password_confirmation: "111111", company: 'Fast Eddie')

10.times do
   from_address = Faker::Address.street_address + ', ' + Faker::Address.city + ', ' + Faker::Address.zip_code
   to_address = Faker::Address.street_address + ', ' + Faker::Address.city + ', ' + Faker::Address.zip_code
   size = ['1', '2', '3'].sample
   fee = [nil, 60, 99, 115, 190].sample
   special_instructions = Faker::Lorem.sentence
   
   me.deliveries.create!(from_address: from_address, size: size, special_instructions: special_instructions, to_address: to_address, fee: fee)
   end