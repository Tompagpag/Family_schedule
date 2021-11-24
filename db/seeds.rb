# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Family.destroy_all
User.destroy_all
FamilyMember.destroy_all

password = "123456"
john = User.create(email: "johndoe.familyschedule@gmail.com", password: password)
jane = User.create(email: "janedoe.familyschedule@gmail.com", password: password)

family = Family.create(last_name: "My family")

FamilyMember.create(first_name: "John", last_name: "Doe", admin: true, family: family, user: john, email: "johndoe.familyschedule@gmail.com")
FamilyMember.create(first_name: "Jane", last_name: "Doe", admin: true, family: family, user: jane, email: "janedoe.familyschedule@gmail.com")
FamilyMember.create(first_name: "Jules", last_name: "Doe", admin: false, family: family)
FamilyMember.create(first_name: "Lola", last_name: "Doe", admin: false, family: family)
