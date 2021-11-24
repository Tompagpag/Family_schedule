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
User.create(email: "t@g.com", password: password)
User.create(email: "b@g.com", password: password)

Family.create(last_name: "My family")

FamilyMember.create(first_name: "Michel", last_name: "Truc", admin: true, family_id: 1, user_id: 1, email: "t@g.com")
FamilyMember.create(first_name: "Bernadette", last_name: "Truc", admin: true, family_id: 1, user_id: 2, email: "b@g.com")
FamilyMember.create(first_name: "Jules", last_name: "Truc", admin: false, family_id: 1)
FamilyMember.create(first_name: "Lola", last_name: "Truc", admin: true, family_id: 1)
