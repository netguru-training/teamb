# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all

user = User.new name: "Imię", surname: "Nazwisko", email: "example@example.com"
user.password = "password123"
user.password_confirmation = "password123"
user.save!