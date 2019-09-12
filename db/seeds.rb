# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Booking.destroy_all
Photo.destroy_all
Post.destroy_all
User.destroy_all


puts 'Creating users...'

joe = User.create(first_name: 'joe', email: 'joe@email.com', password: '123456', address: '950 Notre-Dame ouest, montreal', remote_photo_url: "https://kitt.lewagon.com/placeholder/users/jdilillo", rating: rand(1..5))
thomas = User.create(first_name: 'thomas', email: 'thomas@email.com', password: '123456', address: '400 rue de l´inspecteur montreal', remote_photo_url: "https://kitt.lewagon.com/placeholder/users/tomkf", rating: rand(1..5))
jose = User.create(first_name: 'jose', email: 'jose@email.com', password: '123456', address: '9073 d´aillon, montreal', remote_photo_url: "https://kitt.lewagon.com/placeholder/users/zeajose", rating: rand(1..5))
gustaf = User.create(first_name: 'gustaf', email: 'gustaf@email.com', password: '123456', address: '8776 barbeau, montreal', remote_photo_url: "https://kitt.lewagon.com/placeholder/users/gfmar", rating: rand(1..5))


puts 'Creating posts and photos....'


# 'camping gear', 'sleeping bags', 'knifes and tools', 'outdoor living', 'outdoor equipment'

post1 = Post.new(title: 'high-tech sleeping bag', price: '20', category: 'sleeping bags', description: 'a super high-tech sleeping bag for up two people')
post1.user = joe
post1.address = joe.address
post1.photos.new(remote_source_url: 'https://source.unsplash.com/qelGaL2OLyE/1600x900')
post1.photos.new(remote_source_url: 'https://source.unsplash.com/jkwbOfd3xJI/1600x900')
post1.save!


post2 = Post.new(title: 'superb kayak', price: '50', category: 'outdoor equipment', description: 'two seater, 10 foot kayak. Made in Sweden.')
post2.user = thomas
post2.address = thomas.address
post2.photos.new(remote_source_url: 'https://source.unsplash.com/ow4QxEMA_zc/1600x900')
post2.photos.new(remote_source_url: 'https://source.unsplash.com/8wwwDJvehKk/1600x900')
post2.save!

###

post21 = Post.new(title: 'Inflatable Mattresses', price: '30', category: 'camping gear', description: 'two seater, 10 foot Inflatable Mattress. Made in Sweden.')
post21.user = thomas
post21.address = thomas.address
post21.photos.new(remote_source_url: 'https://source.unsplash.com/q2tJgiV7Lew/1600x900')
post21.save!

post22 = Post.new(title: 'Duffle bag', price: '53', category: 'camping gear', description: 'perfect to hide dead bodies. Made in Sweden.')
post22.user = thomas
post22.address = thomas.address
post22.photos.new(remote_source_url: 'https://source.unsplash.com/9XiN0r2NWSM/1600x900')
post22.save!

##

post3 = Post.new(title: 'hiking pole', price: '5', category: 'outdoor equipment', description: 'a nice stick for our daily hikes')
post3.user = jose
post3.address = jose.address
post3.photos.new(remote_source_url: 'https://source.unsplash.com/-I-McziCxxM/1600x900')
post3.photos.new(remote_source_url: 'https://source.unsplash.com/FoY_p4LoPSM/1600x900')
post3.save!

post31 = Post.new(title: 'Hunting Riffle', price: '100', category: 'outdoor equipment', description: 'bad ass sniper rifle, perfect for your daily adventures')
post31.user = jose
post31.address = "5333 Casgrain Ave, Montreal"
post31.photos.new(remote_source_url: 'https://source.unsplash.com/7VTeOoVXehA/1600x900')
post31.photos.new(remote_source_url: 'https://source.unsplash.com/zYJ9cVjHyZA/1600x900')
post31.photos.new(remote_source_url: 'https://source.unsplash.com/799IZNkVopA/1600x900')
post31.save!

post32 = Post.new(title: 'Hunting knife', price: '83', category: 'outdoor equipment', description: 'a nice knife for your hikes')
post32.user = jose
post32.address = "1196 Voie Camillien-Houde, Montreal"
post32.photos.new(remote_source_url: 'https://source.unsplash.com/eSKxTEoef2o/1600x900')
post32.photos.new(remote_source_url: 'https://source.unsplash.com/-YPxLkfj3Ao/1600x900')
post32.photos.new(remote_source_url: 'https://source.unsplash.com/l3qJvLhZJg0/1600x900')
post32.save!

post33 = Post.new(title: 'Big tent', price: '52', category: 'camping gear', description: 'a nice big ass tent')
post33.user = jose
post33.address = "3000 Chemin de la Cote-Sainte-Catherine, Montreal"
post33.photos.new(remote_source_url: 'https://source.unsplash.com/D-S-Sy13Z_0/1600x900')
post33.photos.new(remote_source_url: 'https://source.unsplash.com/V7uP-XzqX18/1600x900')
post33.save!

post4 = Post.new(title: 'nice tent for up to 3 people', price: '90', category: 'outdoor living', description: 'a tent big enough for two people, very nice')
post4.user = gustaf
post4.address = "405 rue st claude, Montreal"
post4.photos.new(remote_source_url: 'https://source.unsplash.com/1o41Wy3Z3kc/1600x900')
post4.photos.new(remote_source_url: 'https://source.unsplash.com/re2LZOB2XvY/1600x900')
post4.save!

# post41 = Post.new(title: 'camping knife', price: '30', category: 'camping gear', description: 'vintage knife perfect for the outdoors')
# post41.user = gustaf
# post41.address = "1595 St Laurent Blvd, Montreal"
# post41.photos.new(remote_source_url: 'https://source.unsplash.com/eSKxTEoef2o/1600x900')
# post41.photos.new(remote_source_url: 'https://source.unsplash.com/l3qJvLhZJg0/1600x900')
# post41.save!

post42 = Post.new(title: 'black knife', price: '24', category: 'outdoor living', description: 'super knife')
post42.user = gustaf
post42.address = "475 Pine Ave W, Montreal"
post42.photos.new(remote_source_url: 'https://source.unsplash.com/VVjcR09AMrU/1600x900')
post42.save!

post5 = Post.new(title: 'Hydro Flask 18 oz', price: '24', category: 'camping gear', description: 'a great flask that will keep the content cool or hot for ever')
post5.user = joe
post5.address = joe.address
post5.photos.new(remote_source_url: 'https://www.hydroflask.com/media/catalog/product/2/0/20180530_hf_hydration_0985_14.jpg')
post5.photos.new(remote_source_url: 'https://source.unsplash.com/1Uj1GF3AzJc/1600x900')
post5.save!


post6 = Post.new(title: 'portable camping chair', price: '5', category: 'camping gear', description: 'lightweight chair for any adventure')
post6.user = thomas
post6.address = thomas.address
post6.photos.new(remote_source_url: 'https://source.unsplash.com/vosixxYJhkU/1600x900')
post6.photos.new(remote_source_url: 'https://source.unsplash.com/qIBk61vHTzs/1600x900')
post6.save!

post61 = Post.new(title: 'Drone', price: '50', category: 'outdoor equipment', description: 'I like black drones, black like my heart')
post61.user = thomas
post61.address = thomas.address
post61.photos.new(remote_source_url: 'https://source.unsplash.com/mnDGSBiOzwU/1600x900')
post61.photos.new(remote_source_url: 'https://source.unsplash.com/ZlkRrzJl20Q/1600x900')
post61.save!


post7 = Post.new(title: 'hammock', price: '9', category: 'camping gear', description: 'super nice portalble hammock for your camping trips')
post7.user = jose
post7.address = jose.address
post7.photos.new(remote_source_url: 'https://source.unsplash.com/dyjH3YMblpo/1600x900')
post7.photos.new(remote_source_url: 'https://source.unsplash.com/Sr5sVt9UG4Q/1600x900')
post7.save!



post8 = Post.new(title: 'super bright flashlight', price: '90', category: 'camping gear', description: 'a LED flashlight, super bright and water resistant')
post8.user = gustaf
post8.address = gustaf.address
post8.photos.new(remote_source_url: 'https://source.unsplash.com/mBz6QjRZKvc/1600x900')
post8.photos.new(remote_source_url: 'https://source.unsplash.com/hi4uyex1tAc/1600x900')
post8.save!



puts 'Creating some fake bookings...'

# Booking.create(user: joe, post: post1, start_date: '2019-05-30', end_date: '2019-06-01', price: '1337', status: 'requested')
Booking.create(user: joe, post: post2, start_date: '2019-05-30', end_date: '2019-07-01', price: '250', status: 'confirmed')
Booking.create(user: joe, post: post3, start_date: '2019-05-30', end_date: '2019-09-21', price: '12312', status: 'payed')
Booking.create(user: joe, post: post4, start_date: '2019-05-30', end_date: '2019-06-01', price: '330', status: 'picked_up')
Booking.create(user: joe, post: post5, start_date: '2019-05-30', end_date: '2019-08-11', price: '95', status: 'returned')
Booking.create(user: joe, post: post6, start_date: '2019-05-30', end_date: '2019-06-23', price: '73', status: 'rejected')
Booking.create(user: joe, post: post7, start_date: '2019-05-30', end_date: '2019-06-23', price: '24', status: 'picked_up')
Booking.create(user: joe, post: post8, start_date: '2019-05-30', end_date: '2019-06-23', price: '15', status: 'requested')

# Booking.create(user: thomas, post: post1, start_date: '2019-05-30', end_date: '2019-06-01', price: '137', status: 'requested')
Booking.create(user: thomas, post: post2, start_date: '2019-05-30', end_date: '2019-07-01', price: '170', status: 'confirmed')
Booking.create(user: thomas, post: post3, start_date: '2019-05-30', end_date: '2019-09-21', price: '12312', status: 'payed')
Booking.create(user: thomas, post: post4, start_date: '2019-05-30', end_date: '2019-06-01', price: '120', status: 'picked_up')
Booking.create(user: thomas, post: post5, start_date: '2019-05-30', end_date: '2019-08-11', price: '27', status: 'requested')
Booking.create(user: thomas, post: post6, start_date: '2019-05-30', end_date: '2019-06-23', price: '17', status: 'rejected')
Booking.create(user: thomas, post: post7, start_date: '2019-05-30', end_date: '2019-06-23', price: '347', status: 'picked_up')
Booking.create(user: thomas, post: post8, start_date: '2019-05-30', end_date: '2019-06-23', price: '257', status: 'requested')

# Booking.create(user: jose, post: post1, start_date: '2019-05-30', end_date: '2019-06-01', price: '1337', status: 'requested')
Booking.create(user: jose, post: post2, start_date: '2019-05-30', end_date: '2019-07-01', price: '172', status: 'confirmed')
Booking.create(user: jose, post: post3, start_date: '2019-05-30', end_date: '2019-09-21', price: '12312', status: 'payed')
Booking.create(user: jose, post: post4, start_date: '2019-05-30', end_date: '2019-06-01', price: '120', status: 'picked_up')
Booking.create(user: jose, post: post5, start_date: '2019-05-30', end_date: '2019-08-11', price: '237', status: 'returned')
Booking.create(user: jose, post: post6, start_date: '2019-05-30', end_date: '2019-06-23', price: '327', status: 'rejected')
Booking.create(user: jose, post: post7, start_date: '2019-05-30', end_date: '2019-06-23', price: '154', status: 'picked_up')
Booking.create(user: jose, post: post8, start_date: '2019-05-30', end_date: '2019-06-23', price: '357', status: 'requested')

Booking.create(user: gustaf, post: post1, start_date: '2019-05-30', end_date: '2019-06-01', price: '1337', status: 'confirmed')
Booking.create(user: gustaf, post: post2, start_date: '2019-05-30', end_date: '2019-07-01', price: '17', status: 'confirmed')
Booking.create(user: gustaf, post: post3, start_date: '2019-05-30', end_date: '2019-09-21', price: '12312', status: 'payed')
Booking.create(user: gustaf, post: post4, start_date: '2019-05-30', end_date: '2019-06-01', price: '120', status: 'picked_up')
Booking.create(user: gustaf, post: post5, start_date: '2019-05-30', end_date: '2019-08-11', price: '227', status: 'returned')
Booking.create(user: gustaf, post: post6, start_date: '2019-05-30', end_date: '2019-06-23', price: '317', status: 'rejected')
Booking.create(user: gustaf, post: post7, start_date: '2019-05-30', end_date: '2019-06-23', price: '737', status: 'picked_up')
Booking.create(user: gustaf, post: post8, start_date: '2019-05-30', end_date: '2019-06-23', price: '7', status: 'requested')


puts 'Finished!'
