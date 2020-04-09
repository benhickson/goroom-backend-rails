# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

alligatorUser = User.create
pizzaUser = User.create
staplerUser = User.create

AnonymousUser.create(display_name: 'Alligator', user: alligatorUser)
AnonymousUser.create(display_name: 'Pizza', user: pizzaUser)
AnonymousUser.create(display_name: 'Stapler', user: staplerUser)

ben = User.create(email: 'ben@thegoroom.com', display_name: 'Ben')
jared = User.create(email: 'jared@thegoroom.com', display_name: 'Jared')
zane = User.create(email: 'zane@thegoroom.com', display_name: 'Zane')

groupBenZane = Group.create(name: 'Ben and Zane')
groupJaredZane = Group.create(name: 'Jared and Zane')
groupBenJared = Group.create(name: 'Ben and Jared')
groupTheTeam = Group.create(name: 'The Team')

Membership.create(user: ben, group: groupBenZane)
Membership.create(user: zane, group: groupBenZane)
Membership.create(user: jared, group: groupJaredZane)
Membership.create(user: zane, group: groupJaredZane)
Membership.create(user: ben, group: groupBenJared)
Membership.create(user: jared, group: groupBenJared)
Membership.create(user: ben, group: groupTheTeam)
Membership.create(user: jared, group: groupTheTeam)
Membership.create(user: zane, group: groupTheTeam)

Room.create(name: 'NeverClosed', creator: ben)
Room.create(name: '2econd-room', creator: ben)
Room.create(name: 'always-open', creator: jared)
