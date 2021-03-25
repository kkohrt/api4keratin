# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[
  %w[Sam Snead sam@snead.net],
  %w[holly smith holly@example.com],
  %w[marty McFly marty@example.com]
].each do |first, last, email|
  User.create(first_name: first, last_name: last, email: email)
end
