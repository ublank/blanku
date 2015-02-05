# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# demo user

Peter = User.create({fname: "Peter", lname: "Hahn", email: "ph@ph.com", password: "test"})
Collin = User.create({fname: "Collin", lname: "M", email: "cm@cm.com", password: "test"})
Ray = User.create({fname: "Ray", lname: "Chiu", email: "rc@rc.com", password: "test"})
Ed = User.create({fname: "Ed", lname: "Brooks", email: "eb@eb.com", password: "test"})

User.create({fname: "test", lname: "test", email: "test@test.com", password: "test", image_url: "https://www.dwolla.com/avatars/" ,})
