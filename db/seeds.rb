# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb
user1 = User.create(name: 'Client User', email: 'client@example.com', password: 'password', role: 'client')
user2 = User.create(name: 'Manager User', email: 'manager@example.com', password: 'password', role: 'manager')
user3 = User.create(name: 'Employee User', email: 'employee@example.com', password: 'password', role: 'employee')

user2.tasks.create(title: 'Task 1', description: 'Task description 1', task_date: Date.today, status: 'pending')
user2.tasks.create(title: 'Task 2', description: 'Task description 2', task_date: Date.today, status: 'pending')