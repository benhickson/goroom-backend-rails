# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

alligator = AnonymousUser.create(display_name: 'Alligator')
pizza = AnonymousUser.create(display_name: 'Pizza')
stapler = AnonymousUser.create(display_name: 'Stapler')

ben = User.create(email: 'ben@thegoroom.com', display_name: 'Ben')
jared = User.create(email: 'jared@thegoroom.com', display_name: 'Jared')
zane = User.create(email: 'zane@thegoroom.com', display_name: 'Zane')

User.create()
