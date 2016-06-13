# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).t
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
password = "password"

ruby = Skill.create(language: "Ruby")
html = Skill.create(name: "HTML")
css = Skill.create(name: "CSS")
rails = Skill.create(name: "Rails")
orms = Skill.create(name: "ActiveRecord")
sinatra = Skill.create(name: "Sinatra")
cli = Skill.create(name: "Command Line")

ror_users = []



8.times do |user|
  user = User.new
  user.name = Faker::Name.name
  user.email = Faker::Internet.email
  user.password = Faker::Internet.password
  user.save
  ror_users << user
end

#8.times do
#  ror_users.push(User.create(name: Faker::Name.name, email: Faker::Internet.email, encrypted_password: User.new(:password => password).encrypted_password))
#end

ror_users.each do |x|
 x.skills << ruby
 x.skills << html
 x.skills << css
 x.skills << rails
 x.skills << orms
 x.skills << sinatra
 x.skills << cli
 x.skills.first.assessments.create(name: Faker::App.name)
 x.skills[3].assessments.create(name: Faker::App.name)
 x.skills[5].assessments.create(name: Faker::App.name)
end

sinatra_users = []

4.times do |user|
  user = User.new
  user.name = Faker::Name.name
  user.email = Faker::Internet.email
  user.password = Faker::Internet.password
  user.save
  sinatra_users << user
end

sinatra_users.each do |x|
  x.skills << ruby
  x.skills << html
  x.skills << css
  x.skills << orms
  x.skills << sinatra
  x.skills << cli
  x.skills.first.assessments.create(name: Faker::App.name)
  x.skills[4].assessments.create(name: Faker::App.name)
 end

 ruby_users = []

 4.times do |user|
   user = User.new
   user.name = Faker::Name.name
   user.email = Faker::Internet.email
   user.password = Faker::Internet.password
   user.save
   ruby_users << user
 end

 ruby_users.each do |x|
   x.skills << ruby
   x.skills << html
   x.skills << css
   x.skills << cli
   x.skills.first.assessments.create(name: Faker::App.name)
  end
