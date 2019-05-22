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

joe = User.create(first_name: 'joe', email: 'joe@email.com', password: '123456', address: '950 Notre-Dame ouest, montreal', remote_photo_url: "https://kitt.lewagon.com/placeholder/users/jdilillo")
thomas = User.create(first_name: 'thomas', email: 'thomas@email.com', password: '123456', address: '400 rue de l´inspecteur montreal', remote_photo_url: "https://kitt.lewagon.com/placeholder/users/tomkf")
jose = User.create(first_name: 'jose', email: 'jose@email.com', password: '123456', address: '9073 d´aillon, montreal', remote_photo_url: "https://kitt.lewagon.com/placeholder/users/zeajose")
gustaf = User.create(first_name: 'gustaf', email: 'gustaf@email.com', password: '123456', address: '8776 barbeau, montreal', remote_photo_url: "https://kitt.lewagon.com/placeholder/users/gfmar")


puts 'Creating posts and photos....'


# 'camping gear', 'sleeping bags', 'knifes and tools', 'outdoor living', 'outdoor equipment'

post1 = Post.new(title: 'high-tech sleeping bag', price: '20', category: 'sleeping bags', description: 'a super high-tech sleeping bag for up two people')
post1.user = joe
post1.address = joe.address
post1.save
Photo.create(post: post1, remote_source_url: 'https://www.montane.co.uk/images/montane-minimus-sleeping-bag-p28-13130_image.jpg')
Photo.create(post: post1, remote_source_url: 'https://i5.walmartimages.com/asr/f1be8694-c319-4d2f-ba19-05e22348d14e_1.1e4d0faa82e3957d4c51e84bf0c2eea3.jpeg?odnHeight=450&odnWidth=450&odnBg=FFFFFF')


post2 = Post.new(title: 'superb kayak', price: '50', category: 'outdoor equipment', description: 'two seater, 10 foot kayak. Made in Sweden.')
post2.user = thomas
post2.address = thomas.address
post2.save
Photo.create(post: post2, remote_source_url: 'https://www.decathlon.co.uk/media/838/8387867/big_1134237.jpg')



post3 = Post.new(title: 'hiking pole', price: '5', category: 'outdoor equipment', description: 'a nice stick for our daily hikes')
post3.user = jose
post3.address = jose.address
post3.save
Photo.create(post: post3, remote_source_url: 'https://images-na.ssl-images-amazon.com/images/I/61V7UTWRMTL._SX425_.jpg')



post4 = Post.new(title: 'nice tent for up to 3 people', price: '90', category: 'outdoor living', description: 'a tent big enough for two people, very nice')
post4.user = gustaf
post4.address = gustaf.address
post4.save
Photo.create(post: post4, remote_source_url: 'https://s7d2.scene7.com/is/image/academy/20191398')


post5 = Post.new(title: 'Hydro Flask 18 oz', price: '2', category: 'camping gear', description: 'a great flask that will keep the content cool or hot for ever')
post5.user = joe
post5.address = joe.address
post5.save
Photo.create(post: post5, remote_source_url: 'https://images-na.ssl-images-amazon.com/images/I/71QB6mO5oeL._SL1500_.jpg')


post6 = Post.new(title: 'portable camping chair', price: '5', category: 'camping gear', description: 'lightweight chair for any adventure')
post6.user = thomas
post6.address = thomas.address
post6.save
Photo.create(post: post6, remote_source_url: 'https://images-na.ssl-images-amazon.com/images/I/911i1ky7GzL._SL1500_.jpg')


post7 = Post.new(title: 'hammock', price: '9', category: 'camping gear', description: 'super nice portalble hammock for your camping trips')
post7.user = jose
post7.address = jose.address
post7.save
Photo.create(post: post7, remote_source_url: 'https://images-na.ssl-images-amazon.com/images/I/61T7uO3x3ML.jpg')



post8 = Post.new(title: 'super bright flashlight', price: '90', category: 'camping gear', description: 'a LED flashlight, super bright and water resistant')
post8.user = gustaf
post8.address = gustaf.address
post8.save
Photo.create(post: post8, remote_source_url: 'https://images-na.ssl-images-amazon.com/images/I/71qszBSu%2ByL._SL1000_.jpg')



puts 'Creating some fake bookings...'

Booking.create(user: joe, post: post1, start_date: '2019-05-30', end_date: '2019-06-01', price: '1337', status: 'requested')
Booking.create(user: joe, post: post2, start_date: '2019-05-30', end_date: '2019-07-01', price: '250', status: 'confirmed')
Booking.create(user: joe, post: post3, start_date: '2019-05-30', end_date: '2019-09-21', price: '12312', status: 'payed')
Booking.create(user: joe, post: post4, start_date: '2019-05-30', end_date: '2019-06-01', price: '330', status: 'picked_up')
Booking.create(user: joe, post: post5, start_date: '2019-05-30', end_date: '2019-08-11', price: '95', status: 'returned')
Booking.create(user: joe, post: post6, start_date: '2019-05-30', end_date: '2019-06-23', price: '73', status: 'rejected')
Booking.create(user: joe, post: post7, start_date: '2019-05-30', end_date: '2019-06-23', price: '24', status: 'picked_up')
Booking.create(user: joe, post: post8, start_date: '2019-05-30', end_date: '2019-06-23', price: '15', status: 'completed')

Booking.create(user: thomas, post: post1, start_date: '2019-05-30', end_date: '2019-06-01', price: '137', status: 'requested')
Booking.create(user: thomas, post: post2, start_date: '2019-05-30', end_date: '2019-07-01', price: '170', status: 'confirmed')
Booking.create(user: thomas, post: post3, start_date: '2019-05-30', end_date: '2019-09-21', price: '12312', status: 'payed')
Booking.create(user: thomas, post: post4, start_date: '2019-05-30', end_date: '2019-06-01', price: '120', status: 'picked_up')
Booking.create(user: thomas, post: post5, start_date: '2019-05-30', end_date: '2019-08-11', price: '27', status: 'returned')
Booking.create(user: thomas, post: post6, start_date: '2019-05-30', end_date: '2019-06-23', price: '17', status: 'rejected')
Booking.create(user: thomas, post: post7, start_date: '2019-05-30', end_date: '2019-06-23', price: '347', status: 'picked_up')
Booking.create(user: thomas, post: post8, start_date: '2019-05-30', end_date: '2019-06-23', price: '257', status: 'completed')

Booking.create(user: jose, post: post1, start_date: '2019-05-30', end_date: '2019-06-01', price: '1337', status: 'requested')
Booking.create(user: jose, post: post2, start_date: '2019-05-30', end_date: '2019-07-01', price: '172', status: 'confirmed')
Booking.create(user: jose, post: post3, start_date: '2019-05-30', end_date: '2019-09-21', price: '12312', status: 'payed')
Booking.create(user: jose, post: post4, start_date: '2019-05-30', end_date: '2019-06-01', price: '120', status: 'picked_up')
Booking.create(user: jose, post: post5, start_date: '2019-05-30', end_date: '2019-08-11', price: '237', status: 'returned')
Booking.create(user: jose, post: post6, start_date: '2019-05-30', end_date: '2019-06-23', price: '327', status: 'rejected')
Booking.create(user: jose, post: post7, start_date: '2019-05-30', end_date: '2019-06-23', price: '154', status: 'picked_up')
Booking.create(user: jose, post: post8, start_date: '2019-05-30', end_date: '2019-06-23', price: '357', status: 'completed')

Booking.create(user: gustaf, post: post1, start_date: '2019-05-30', end_date: '2019-06-01', price: '1337', status: 'requested')
Booking.create(user: gustaf, post: post2, start_date: '2019-05-30', end_date: '2019-07-01', price: '17', status: 'confirmed')
Booking.create(user: gustaf, post: post3, start_date: '2019-05-30', end_date: '2019-09-21', price: '12312', status: 'payed')
Booking.create(user: gustaf, post: post4, start_date: '2019-05-30', end_date: '2019-06-01', price: '120', status: 'picked_up')
Booking.create(user: gustaf, post: post5, start_date: '2019-05-30', end_date: '2019-08-11', price: '227', status: 'returned')
Booking.create(user: gustaf, post: post6, start_date: '2019-05-30', end_date: '2019-06-23', price: '317', status: 'rejected')
Booking.create(user: gustaf, post: post7, start_date: '2019-05-30', end_date: '2019-06-23', price: '737', status: 'picked_up')
Booking.create(user: gustaf, post: post8, start_date: '2019-05-30', end_date: '2019-06-23', price: '7', status: 'completed')


puts 'Finished!'
