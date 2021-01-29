# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

####### USERS ########
user1 = User.create(first_name:'Emmanuel', last_name:'President' email:'emmanuel@mail.com', password:'123');

####### APPARTEMENTS ########
appart1 = Appartements.create(name:"test1", price:1000, description:"description blabla", address:"32 rue du moulin", postcode:77324, city:"Moscou", user_id:user1);

####### MESSAGES ########
Messages.create(contenu:"test message", user_id:user1, appartement_id:appart1);