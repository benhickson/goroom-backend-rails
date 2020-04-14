# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ben = User.create(email: 'ben@thegoroom.com', password: 'mypassword', display_name: 'Ben')
jared = User.create(email: 'jared@thegoroom.com', password: 'mypassword', display_name: 'Jared')
zane = User.create(email: 'zane@thegoroom.com', password: 'mypassword', display_name: 'Zane')

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

Room.create(name: 'party-room', creator: ben)
Room.create(name: 'HudsonChat', creator: ben)
Room.create(name: 'PRL-Episode-Recorder', creator: jared)
Room.create(name: 'pokernight', creator: jared)
Room.create(name: 'prl-off-the-record', creator: jared)
Room.create(name: 'cowboy', creator: zane)
Room.create(name: 'poker', creator: zane)
