# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Race.destroy_all
Flashcard.destroy_all
Stock.destroy_all
Task.destroy_all
Widget.destroy_all
User.destroy_all

puts "Creating sample users..."
sugi = User.create!(email: "sugi@dashboard.com", password: "1234567", first_name: "Sugi", last_name:"Henson")
max = User.create!(email: "max@dashboard.com", password: "1234567", first_name: "Max", last_name:"Alings")
eva = User.create!(email: "eva@dashboard.com", password: "1234567", first_name: "Eva", last_name:"Orlandini")
nini = User.create!(email: "nini@dashboard.com", password: "1234567", first_name: "Nini", last_name:"Shen")
fra = User.create!(email: "fra@dashboard.com", password: "1234567", first_name: "Fra", last_name:"Christmas")
brian = User.create!(email: "brian@dashboard.com", password: "1234567", first_name: "Brian", last_name:"Baker")

finance = Widget.create!(user: max, category: "stock_portfolio", height: 1, width: 2)
Stock.create!(tickr: "VOO", amount: 10, purchase_price: 100, widget: finance)
puts "Creating sample widget"
fitness_widget = Widget.create!(category: "fitness", position_x: 0, position_y: 0, width: 3, height: 2, user: nini)

puts "Creating sample fitness tasks"
fitness_task_1 = Task.create!(title: "Cardio intense 5k", done: false, widget: fitness_widget, monday: true, wednesday: true, friday: true)
fitness_task_2 = Task.create!(title: "Cardio relax 10k", done: false, widget: fitness_widget, friday: true, wednesday: true)
fitness_task_3 = Task.create!(title: "Upperbody Strength", done: false, widget: fitness_widget, tuesday: true, thursday: true)
fitness_task_4 = Task.create!(title: "Lowerbody Strength", done: false, widget: fitness_widget, monday: true, wednesday: true, friday:true)
fitness_task_5 = Task.create!(title: "Core Strength", done: false, widget: fitness_widget, monday: true, wednesday: true, friday:true)

puts "habit widgets created"
habit_widget = Widget.create!( category: "habits", position_x: 0, position_y: 0, width: 2, height: 2, user: sugi)

puts "tasks for task widget created"
Task.create!(title: "read", done: false, widget: habit_widget)
Task.create!(title: "meditate", done: true, widget: habit_widget)
Task.create!(title: "exercise", done: false, widget: habit_widget)
Task.create!(title: "floss", done: true, widget: habit_widget)
Task.create!(title: "journal", done: false, widget: habit_widget)

puts "user and widget created"
Widget.create!( category: "time", user: nini, position_x: 0, position_y: 0, width: 1, height: 1, timezone: "new york")
Widget.create!( category: "time", user: eva, position_x: 0, position_y: 0, width: 1, height: 1, timezone: "new york")
Widget.create!( category: "time", user: fra, position_x: 0, position_y: 0, width: 1, height: 1, timezone: "new york")
Widget.create!( category: "time", user: max, position_x: 0, position_y: 0, width: 1, height: 1, timezone: "new york")
Widget.create!( category: "time", user: brian, position_x: 0, position_y: 0, width: 1, height: 1, timezone: "new york")
Widget.create!( category: "time", user: brian, position_x: 0, position_y: 0, width: 1, height: 1, timezone: "new york")

flashcard = Widget.create!(user: fra, category: "flashcards", position_x: 0, position_y: 0, width: 3, height: 1)

puts "flashcards deck created"
Flashcard.create!(question: "what is the capital of France ?", answer: "Paris", widget: flashcard)
Flashcard.create!(question: "what is the capital of Brazil ?", answer: "Brasilia", widget: flashcard)
Flashcard.create!(question: "what is the capital of Ouganda ?", answer: "Kampala", widget: flashcard)
Flashcard.create!(question: "what is the capital of argentina ?", answer: "Buenos Aires", widget: flashcard)
Flashcard.create!(question: "what is the capital of Indonesia ?", answer: "Jakarta but soon Nusantara", widget: flashcard)

Widget.create!(category: "weather", user: eva, width: 2, height: 1, timezone: "new york")

puts "sample races created.."
Race.create!(day: 12, month: 1, year: 2025, widget: fitness_widget)

puts "sample training widget created.."
Widget.create!(category: "fitness", goal: 100.00, progress: 48.5, user: nini)
