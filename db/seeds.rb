# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "deleting everything"
User.destroy_all
Park.destroy_all
Post.destroy_all
Feature.destroy_all

puts "creating users"
User.create(email: "mattdamon@gmail.com", password: "asdfasdf", first_name: "Matt", last_name: "Damon")
User.create(email: "benaffleck@gmail.com", password: "asdfasdf", first_name: "Ben", last_name: "Affleck")
User.create(email: "caseyaffleck@gmail.com", password: "asdfasdf", first_name: "Casey", last_name: "Affleck")

puts "creating parks"
Park.create(parkname: "DUPONT COURTS", parktype: "Neighborhood Park or Playground", score: "77.2", zipcode: "94121")
Park.create(parkname: "SOUTH PARK", parktype: "Neighborhood Park or Playground", score: "79.4", zipcode: "94107")
Park.create(parkname: "TWIN PEAKS", parktype: "Regional Park", score: "?", zipcode: "94131")

puts "creating features"
Feature.create(name: "Soccer Field")
Feature.create(name: "Tennis Courts")
Feature.create(name: "PokeStop")

puts "creating posts"
Park.first.posts << User.first.posts.create(body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse in urna lorem. Cras et risus pellentesque, sollicitudin eros quis, interdum nisi. Ut sed eleifend urna. Donec massa velit, accumsan a augue ac, bibendum gravida dui. Phasellus feugiat, mi quis lacinia.")
Park.first.posts << User.second.posts.create(body: "Sed commodo felis tortor, dapibus ullamcorper lectus facilisis at. Donec tempor nulla non lacus iaculis, ac fringilla massa tincidunt. Donec orci velit, convallis lobortis venenatis condimentum, facilisis faucibus odio. Vivamus fringilla lectus ac purus dignissim euismod. Nulla metus massa, vestibulum.")
Park.first.posts << User.third.posts.create(body: "Pellentesque euismod odio sem, laoreet laoreet enim varius ut. Sed molestie malesuada tincidunt. Curabitur congue nisl in libero feugiat porta. Ut aliquam aliquam dolor, sit amet varius odio. Vestibulum et leo tempor, cursus orci at, lobortis risus. Maecenas mollis leo.")
Park.second.posts << User.first.posts.create(body: "Health goth fap kitsch readymade. Cliche four dollar toast plaid, slow-carb fap squid salvia readymade butcher locavore everyday carry single-origin coffee tofu microdosing. Portland tumblr chillwave blue bottle iPhone, semiotics wayfarers paleo.")
Park.second.posts << User.second.posts.create(body: "Church-key everyday carry selfies, DIY kogi hashtag tacos jean shorts vegan kombucha biodiesel. Skateboard salvia brunch austin, tumblr synth roof party. Normcore farm-to-table umami direct trade.")
Park.second.posts << User.third.posts.create(body: "Whatever banjo gochujang literally. 3 wolf moon kitsch cred, salvia wolf pickled meh street art typewriter YOLO mustache wayfarers XOXO. Occupy paleo scenester, marfa sustainable photo booth organic. ")
Park.third.posts << User.first.posts.create(body: "I ran into my good friend Kyle here. He's a little weird.")
Park.third.posts << User.second.posts.create(body: "This place is strange. I'm not sure how I got there but..")

puts "connecting features to parks"
Park.first.features = [Feature.first, Feature.second, Feature.third]
Park.second.features = [Feature.first, Feature.third]
Park.third.features = [Feature.third]