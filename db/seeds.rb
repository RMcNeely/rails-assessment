    # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or buildd alongside the db with db:setup).t
#
# Examples:
#
#   cities = City.build([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.build(name: 'Emanuel', city: cities.first)
password = "password"

ruby = Skill.create(name: "Ruby")
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

ror_users.each do |x|
 first = x.assessments.create(name: Faker::App.name, link: Faker::Internet.url('github.com'))
 second = x.assessments.create(name: Faker::App.name, link: Faker::Internet.url('github.com'))
 x.assessment_skills.build(assessment_id: first.id, skill_id: ruby.id).save
 x.assessment_skills.build(assessment_id: first.id, skill_id: html.id).save
 x.assessment_skills.build(assessment_id: first.id, skill_id: css.id).save
 x.assessment_skills.build(assessment_id: first.id, skill_id: rails.id).save
 x.assessment_skills.build(assessment_id: first.id, skill_id: orms.id).save
 x.assessment_skills.build(assessment_id: first.id, skill_id: sinatra.id).save
 x.assessment_skills.build(assessment_id: first.id, skill_id: cli.id).save
 x.assessment_skills.build(assessment_id: second.id, skill_id: ruby.id).save
 x.assessment_skills.build(assessment_id: second.id, skill_id: html.id).save
 x.assessment_skills.build(assessment_id: second.id, skill_id: css.id).save
 x.assessment_skills.build(assessment_id: second.id, skill_id: rails.id).save
 x.assessment_skills.build(assessment_id: second.id, skill_id: orms.id).save
 x.assessment_skills.build(assessment_id: second.id, skill_id: sinatra.id).save
 x.assessment_skills.build(assessment_id: second.id, skill_id: cli.id).save
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
  first = x.assessments.create(name: Faker::App.name, link: Faker::Internet.url('github.com'))
  second =  x.assessments.create(name: Faker::App.name, link: Faker::Internet.url('github.com'))
  x.assessment_skills.build(assessment_id: first.id, skill_id: ruby.id).save
  x.assessment_skills.build(assessment_id: first.id, skill_id: html.id).save
  x.assessment_skills.build(assessment_id: first.id, skill_id: css.id).save
  x.assessment_skills.build(assessment_id: first.id, skill_id: orms.id).save
  x.assessment_skills.build(assessment_id: first.id, skill_id: sinatra.id).save
  x.assessment_skills.build(assessment_id: first.id, skill_id: cli.id).save
  x.assessment_skills.build(assessment_id: second.id, skill_id: ruby.id).save
  x.assessment_skills.build(assessment_id: second.id, skill_id: html.id).save
  x.assessment_skills.build(assessment_id: second.id, skill_id: css.id).save
  x.assessment_skills.build(assessment_id: second.id, skill_id: orms.id).save
  x.assessment_skills.build(assessment_id: second.id, skill_id: sinatra.id).save
  x.assessment_skills.build(assessment_id: second.id, skill_id: cli.id).save
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
   first = x.assessments.create(name: Faker::App.name, link: Faker::Internet.url('github.com'))
   x.assessment_skills.build(assessment_id: first.id, skill_id: ruby.id).save
   x.assessment_skills.build(assessment_id: first.id, skill_id: html.id).save
   x.assessment_skills.build(assessment_id: first.id, skill_id: css.id).save
   x.assessment_skills.build(assessment_id: first.id, skill_id: cli.id).save
  end

  User.create(name: "Fake Avi", admin: true, password: password, email: "fake_avi@totally-real-flatiron.com")
