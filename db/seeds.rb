# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.prod([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.prod(name: 'Emanuel', city: cities.first)

User.create(username: "test", password: "Qwerty12")

Operation.create(monday: "10:00 - 20:00", tuesday: "10:00 - 20:00", wednesday: "10:00 - 20:00", thursday: "10:00 - 20:00", friday: "10:00 - 20:00", sunday: "10:00 - 20:00", saturday: "10:00 - 20:00")