
Place.destroy_all
Profile.destroy_all
User.destroy_all

u1 = User.create!(email: 'teste@test.com', password: 'tatatoto')
u2 = User.create!(email: 'johndoe@test.com', password: 'johndoe')
u3 = User.create!(email: 'ami@test.com', password: 'amitest')


p1 = Place.create!(name: 'Chez Fred', description:'Un très beau séjour dans la bourgogne', address: '12 place des martyrs, Lille', nbr_person: '92', user: u1, price: 50)

p2 = Place.create!(name: 'Chez Jack', description:'Voyage exceptionnel au coeur des vignes de Provence', address: 'Manosque', nbr_person: '92', user: u2, price: 100)
p3 = Place.create!(name: 'Chez Michou', description:'Une belle douceure', address: 'Paris', nbr_person: '92', user: u3, price: 200)


prof1 = Profile.create!(last_name: 'Foé', first_name: 'Marc Vivien', user: u1)
prof2 = Profile.create!(last_name: 'Doe', first_name: 'John', user: u2)
prof3 = Profile.create!(last_name: 'Jean', first_name: 'Michel', user: u3)

placereview1 = PlaceReview.create!(rating: 3, description: 'Du vin à foison', user: u1, place: p1)

userreview1 = UserReview.create!(rating: 2, description: 'client agreable', user: u1, place: p1)

booking1 = Booking.create!(start_date: Date.new(2017,5,1), end_date: Date.new(2017,5,8), price:100, user: u1, place: p2, status: "refused")
booking2 = Booking.create!(start_date: Date.new(2017,6,1), end_date: Date.new(2017,6,18), price:200, user: u1, place: p2, status: "accepted")
booking3 = Booking.create!(start_date: Date.new(2017,5,12), end_date: Date.new(2017,5,18), price:100, user: u3, place: p1, status: "refused")
booking4 = Booking.create!(start_date: Date.new(2017,5,28), end_date: Date.new(2017,6,01), price:200, user: u2, place: p1, status: "accepted")
booking5 = Booking.create!(start_date: Date.new(2017,5,24), end_date: Date.new(2017,6,8), price:100, user: u2, place: p1, status: "refused")
booking6 = Booking.create!(start_date: Date.new(2017,6,10), end_date: Date.new(2017,6,18), price:200, user: u1, place: p2, status: "accepted")
booking7 = Booking.create!(start_date: Date.new(2017,6,24), end_date: Date.new(2017,7,8), price:100, user: u1, place: p2, status: "pending")
booking8 = Booking.create!(start_date: Date.new(2017,6,10), end_date: Date.new(2017,6,18), price:200, user: u1, place: p1, status: "pending")

availibility_1 = Availibility.create!(price: 80, start_date: Date.new(2017,6,01), end_date: Date.new(2017,6,18), place: p1)
availibility_2 = Availibility.create!(price: 90, start_date: Date.new(2017,7,01), end_date: Date.new(2017,7,02), place: p1)



