# This file should contain all the record creation needed to seed the database with its default values.
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

joe = User.create(first_name: 'joe', email: 'joe@email.com', password: '123456', address: 'westside', remote_photo_url: "https://kitt.lewagon.com/placeholder/users/jdilillo")
thomas = User.create(first_name: 'thomas', email: 'thomas@email.com', password: '123456', address: 'victoria', remote_photo_url: "https://kitt.lewagon.com/placeholder/users/tomkf")
jose = User.create(first_name: 'jose', email: 'jose@email.com', password: '123456', address: 'downtown', remote_photo_url: "https://kitt.lewagon.com/placeholder/users/zeajose")
gustaf = User.create(first_name: 'gustaf', email: 'gustaf@email.com', password: '123456', address: 'la gare', remote_photo_url: "https://kitt.lewagon.com/placeholder/users/gfmar")


puts 'Creating posts and photos....'

post1 = Post.new(title: 'sleeping bag for rent', price: '10', category: 'camping equipment', description: 'a sleeping bag for two people')
post1.user = joe
post1.address = joe.address
post1.save
Photo.create(post: post1, remote_source_url: 'https://www.montane.co.uk/images/montane-minimus-sleeping-bag-p28-13130_image.jpg')
Photo.create(post: post1, remote_source_url: 'https://i5.walmartimages.com/asr/f1be8694-c319-4d2f-ba19-05e22348d14e_1.1e4d0faa82e3957d4c51e84bf0c2eea3.jpeg?odnHeight=450&odnWidth=450&odnBg=FFFFFF')

post2 = Post.new(title: 'kayak', price: '50', category: 'water sports', description: 'two seaters, 10 foot kayak')
post2.user = thomas
post2.address = thomas.address
post2.save
Photo.create(post: post2, remote_source_url: 'https://www.decathlon.co.uk/media/838/8387867/big_1134237.jpg')


post3 = Post.new(title: 'hiking pole', price: '5', category: 'hiking equipment', description: 'a nice stick')
post3.user = jose
post3.address = jose.address
post3.save
Photo.create(post: post3, remote_source_url: 'https://images-na.ssl-images-amazon.com/images/I/61V7UTWRMTL._SX425_.jpg')


post4 = Post.new(title: 'nice tent for up to 3 people', price: '90', category: 'camping equipment', description: 'a tent bag for two people, very nice')
post4.user = gustaf
post4.address = gustaf.address
post4.save
Photo.create(post: post4, remote_source_url: 'https://s7d2.scene7.com/is/image/academy/20191398')

puts 'Creating some fake bookings...'

Booking.create(user: joe, post: post1, start_date: '2019-05-30', end_date: '2019-06-01', price: '1337', status: 'completed')
Booking.create(user: joe, post: post2, start_date: '2019-05-30', end_date: '2019-06-01', price: '1337', status: 'requested')

Booking.create(user: thomas, post: post1, start_date: '2019-05-30', end_date: '2019-06-01', price: '1337', status: 'completed')
Booking.create(user: thomas, post: post2, start_date: '2019-05-30', end_date: '2019-06-01', price: '1337', status: 'requested')

Booking.create(user: jose, post: post1, start_date: '2019-05-30', end_date: '2019-06-01', price: '1337', status: 'completed')
Booking.create(user: jose, post: post2, start_date: '2019-05-30', end_date: '2019-06-01', price: '1337', status: 'requested')

Booking.create(user: gustaf, post: post1, start_date: '2019-05-30', end_date: '2019-06-01', price: '1337', status: 'completed')
Booking.create(user: gustaf, post: post2, start_date: '2019-05-30', end_date: '2019-06-01', price: '1337', status: 'requested')


puts 'Finished!'
