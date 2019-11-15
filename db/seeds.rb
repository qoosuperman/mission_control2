# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u1 = User.create(name: "QOO1", email: "qqq@gmail.com", password: "123456", password_confirmation: "123456", role: "admin")
u2 = User.create(name: "QOO2", email: "www@gmail.com", password: "123456", password_confirmation: "123456")

FactoryBot.create(:mission, title: "q1_1", user_id: u1.id)
FactoryBot.create(:mission, title: "q1_2", user_id: u1.id)

FactoryBot.create(:mission, title: "q2_1", user_id: u2.id)
FactoryBot.create(:mission, title: "q2_2", user_id: u2.id)
FactoryBot.create(:mission, title: "q2_3", user_id: u2.id)
