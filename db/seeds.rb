Area.create(name: 'City Bowl')
Area.create(name: 'Southern Suburbs')
Area.create(name: 'West Coast')
Area.create(name: 'Atlantic Seaboard')
Area.create(name: 'Northern Suburbs')

me = User.create(name: 'Grant', contact_number: '080 990 9987', email: 'grant@spam.com', password: "111111", password_confirmation: "111111", company: 'Fast Eddie')

10.times do
   from_address = Faker::Address.street_address + ', ' + Faker::Address.city + ', ' + Faker::Address.zip_code
   to_address = Faker::Address.street_address + ', ' + Faker::Address.city + ', ' + Faker::Address.zip_code
   quote = ['90', '100', '120'].sample
   special_instructions = Faker::Lorem.sentence
   from_area = Area.first(:offset => rand(Area.count))
   to_area = Area.first(:offset => rand(Area.count))
   me.deliveries.create!(from_address: from_address, from_area: from_area, quote: quote, special_instructions: special_instructions, to_address: to_address, to_area: to_area)
   end