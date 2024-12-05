# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Task.destroy_all
Widget.destroy_all
User.destroy_all

puts "Creating sample users..."
sugi = User.create!(email: "sugi@dashboard.com", password: "1234567", first_name: "Sugi")
max = User.create!(email: "max@dashboard.com", password: "1234567", first_name: "Max")
eva = User.create!(email: "eva@dashboard.com", password: "1234567", first_name: "Eva")
nini = User.create!(email: "nini@dashboard.com", password: "1234567", first_name: "Nini")
fra = User.create!(email: "fra@dashboard.com", password: "1234567", first_name: "Fra")

finance = Widget.create!(user: sugi, category: "stock_portfolio")
Stock.create!(tickr: "VOO", amount: 10, purchase_price: 100, widget: finance)
puts "Creating sample widget"
fitness_widget = Widget.create!(category: "fitness", position_x: 0, position_y: 0, width: 2, height: 2, user: nini)

puts "Creating sample fitness tasks"
fitness_task_1 = Task.create!(title: "Cardio intense 5k", done: false, widget: fitness_widget, monday: true, wednesday: true)
fitness_task_2 = Task.create!(title: "Cardio relax 10k", done: false, widget: fitness_widget, friday: true, wednesday: true)
fitness_task_3 = Task.create!(title: "Upperbody Strength", done: false, widget: fitness_widget, tuesday: true, thursday: true)
fitness_task_4 = Task.create!(title: "Lowerbody Strength", done: false, widget: fitness_widget, monday: true, wednesday: true)

puts "user and widget created"
habit_widget = Widget.create!( category: "habit", position_x: 0, position_y: 0, width: 2, height: 2, user: sugi)

Task.create!(title: "read", done: false, widget: habit_widget)
Task.create!(title: "meditate", done: true, widget: habit_widget)
Task.create!(title: "exercise", done: false, widget: habit_widget)
Task.create!(title: "floss", done: true, widget: habit_widget)
Task.create!(title: "journal", done: false, widget: habit_widget)
