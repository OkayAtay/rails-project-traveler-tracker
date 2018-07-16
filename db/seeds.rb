white_house = Attraction.create({name: "White House", location: "Washington, DC", hours: "9am-5pm", price: 0})
empire_state_building =Attraction.create({name: "Empire State Building", location: "NYC", hours: "9am-5pm", price: 0})
statue_of_liberty = Attraction.create({name: "Statue of Liberty", location: "NYC", hours: "9am-5pm", price: 35})
washington_monument = Attraction.create({name: "Washington Monument", location: "Washington, DC", hours: "9am-5pm", price: 0})

araba = Traveler.create({name: "Araba", email: "a@gmail.com", password: "12345", budget: 50, nationality: "USA", interests:"history"})


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
