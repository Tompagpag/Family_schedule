# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Family.destroy_all
User.destroy_all
FamilyMember.destroy_all
Contact.destroy_all

password = "123456"
john = User.create(email: "johndoe.familyschedule@gmail.com", password: password)
jane = User.create(email: "janedoe.familyschedule@gmail.com", password: password)

family = Family.create!(last_name: "Ma Family")

FamilyMember.create!(first_name: "Alex", last_name: "Desrosiers", admin: true, family: family, user: john, email: "johndoe.familyschedule@gmail.com")
FamilyMember.create!(first_name: "Juliette", last_name: "Desrosiers", admin: true, family: family, user: jane, email: "janedoe.familyschedule@gmail.com")
jules = FamilyMember.create!(first_name: "Jules", last_name: "Desrosiers", admin: false, family: family)
lola = FamilyMember.create!(first_name: "Lola", last_name: "Desrosiers", admin: false, family: family)

Event.create(title: "tennis", start_at: "2021-12-01-11:30", end_at: "2021-12-01-12:45", family: family, family_member: jules)
Event.create(title: "danse", start_at: "2021-12-01-12:30", end_at: "2021-12-01-14:00", family: family, family_member: lola)

# 10.times do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   email = Faker::Internet.email
#   phone_number = Faker::PhoneNumber.phone_number
#   Contact.create(first_name: first_name, last_name: last_name, email: email, phone_number: phone_number, family: family)
# end

Contact.create!(first_name: "Jean-Pierre", last_name: "Desrosiers", email: "jpdesrosiers@hotmail.com", phone_number: "0682251042", comment: "grand-père", family: family)
Contact.create!(first_name: "Michèle", last_name: "Desrosiers", email: "mdesrosiers1949@hotmail.com", phone_number: "06948017",  comment: "grand-mère", family: family)
Contact.create!(first_name: "Louis", last_name: "Lafont", email: "llafont@gmail.com", phone_number: "0186339820", comment: "grand-père", family: family)
Contact.create!(first_name: "Bernadette", last_name: "Lafont", email: "bernadette.lafont@gmail.com", phone_number: "0186339820", comment: "grand-mère", family: family)
Contact.create!(first_name: "Brigitte", last_name: "Berto", email: "berto.brigitte@gmail.com", phone_number: "0652074409", comment: "baby-sitter", family: family)
Contact.create!(first_name: "Marine", last_name: "Godin", email: "godin.marine@marinegodin.com", phone_number: "0638941031", comment: "baby-sitter", family: family)
Contact.create!(first_name: "Sylvain", last_name: "Desrosiers", email: "sylvain@customsound.com", phone_number: "0669992793", comment: "oncle", family: family)
Contact.create!(first_name: "Laurene", last_name: "Cartier", email: "laurenecartier@yahoo.com", phone_number: "0648289451", comment: "voisine", family: family)
Contact.create!(first_name: "Edwine", last_name: "Bitton", email: "edwine@negatifplus.com", phone_number: "0612130907", comment: "maman de Théo", family: family)
Contact.create!(first_name: "Adama", last_name: "Kouami", email: "Kouami.adama@gmail.com", phone_number: "0639669723", comment: "voisin", family: family)
Contact.create!(first_name: "Hoki", last_name: "Tokuda", email: "hokipoki@gmail.com", phone_number: "0611589240", comment: "maman de Keiko", family: family)
Contact.create!(first_name: "Olivier", last_name: "Bolano", email: "olivier@savagedetectives.com", phone_number: "0640531901", comment: "papa de Roberto", family: family)
