# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all

user = User.new name: "Imię", surname: "Nazwisko", email: "example@example.com"
user.password = "password123"
user.password_confirmation = "password123"
user.save!

Admin.destroy_all

admin = Admin.new email: "admin@example.com"
admin.password = "admin123"
admin.save!

Team.destroy_all

10.times do |n|
  team = Team.new name: "Drużyna #{n}"
  team.save!
end

Match.destroy_all

3.times do |n|
  match = Match.new
  teams = Team.all.to_a
  match.team_a = teams.delete(teams.sample)
  match.team_b = teams.sample
  if rand(2) == 1
    match.team_a_goals = rand(3)
    match.team_b_goals = rand(3)
  end
  match.save!
end


Bet.destroy_all

Match.all.each do |match|
  2.times do |n|
    bet=Bet.new team_a_goals: 1, team_b_goals: 2
    bet.match=match
    bet.user=user
    bet.save!
  end
end