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

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  phone_number = Faker::PhoneNumber.phone_number
  Contact.create(first_name: first_name, last_name: last_name, email: email, phone_number: phone_number, family: family)
end
