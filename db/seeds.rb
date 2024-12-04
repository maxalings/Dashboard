# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all

puts "Creating sample users..."
sugi = User.create!(email: "sugi@dashboard.com", password: "1234567", first_name: "Sugi")
max = User.create!(email: "max@dashboard.com", password: "1234567", first_name: "Max")
eva = User.create!(email: "eva@dashboard.com", password: "1234567", first_name: "Eva")
nini = User.create!(email: "nini@dashboard.com", password: "1234567", first_name: "Nini")
fra = User.create!(email: "fra@dashboard.com", password: "1234567", first_name: "Fra")

habit_widget = Widget.create!(
type: "habit",
position_x: 0,
position_y: 0,
width: 2,
height: 2,
user: sugi)