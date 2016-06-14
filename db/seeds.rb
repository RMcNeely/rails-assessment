# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).t
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
password = "password"

#ruby = Skill.create(name: "Ruby")
#html = Skill.create(name: "HTML")
#css = Skill.create(name: "CSS")
#rails = Skill.create(name: "Rails")
#orms = Skill.create(name: "ActiveRecord")
#sinatra = Skill.create(name: "Sinatra")
#cli = Skill.create(name: "Command Line")

ror_users = []

8.times do |user|
  user = Student.new
  user.name = Faker::Name.name
  user.email = Faker::Internet.email
  user.password = Faker::Internet.password
  user.save
  ror_users << user
end

ror_users.each do |x|
 x.skills << ruby = Skill.create(name: "Ruby")
 x.skills << html = Skill.create(name: "HTML")
 x.skills << css = Skill.create(name: "CSS")
 x.skills << rails = Skill.create(name: "Rails")
 x.skills << orms = Skill.create(name: "ActiveRecord")
 x.skills << sinatra = Skill.create(name: "Sinatra")
 x.skills << cli = Skill.create(name: "Command Line")
 a = Assessment.create(name: Faker::App.name, link: Faker::Internet.url('github.com'), student_id: x.id)
 b = Assessment.create(name: Faker::App.name, link: Faker::Internet.url('github.com'), student_id: x.id)
 a.skills << ruby
 a.skills << html
 a.skills << css
 a.skills << orms
 a.skills << sinatra
 a.skills << cli
 a.skills << rails
 b.skills << rails
 b.skills << ruby
 b.skills << html
 b.skills << css
 b.skills << orms
 b.skills << sinatra
 b.skills << cli
end

sinatra_users = []

4.times do |user|
  user = Student.new
  user.name = Faker::Name.name
  user.email = Faker::Internet.email
  user.password = Faker::Internet.password
  user.save
  sinatra_users << user
end

sinatra_users.each do |x|
  a = Assessment.create(name: Faker::App.name, link: Faker::Internet.url('github.com'), student_id: x.id)
  b = Assessment.create(name: Faker::App.name, link: Faker::Internet.url('github.com'), student_id: x.id)
  x.skills << ruby = Skill.create(name: "Ruby")
  x.skills << html= Skill.create(name: "HTML")
  x.skills << css = Skill.create(name: "CSS")
  x.skills << orms = Skill.create(name: "ActiveRecord")
  x.skills << sinatra = Skill.create(name: "Sinatra")
  x.skills << cli = Skill.create(name: "Command Line")
  a.skills << ruby
  a.skills << html
  a.skills << css
  a.skills << orms
  a.skills << sinatra
  a.skills << cli
  b.skills << ruby
  b.skills << html
  b.skills << css
  b.skills << orms
  b.skills << sinatra
  b.skills << cli

 end

 ruby_users = []

 4.times do |user|
   user = Student.new
   user.name = Faker::Name.name
   user.email = Faker::Internet.email
   user.password = Faker::Internet.password
   user.save
   ruby_users << user
 end

 ruby_users.each do |x|
   x.skills << ruby = Skill.create(name: "Ruby")
   x.skills << html= Skill.create(name: "HTML")
   x.skills << css = Skill.create(name: "CSS")
   x.skills << cli = Skill.create(name: "Command Line")
   a = Assessment.create(name: Faker::App.name, link: Faker::Internet.url('github.com'), student_id: x.id)
   a.skills << ruby
   a.skills << html
   a.skills << css
   a.skills << cli
  end
