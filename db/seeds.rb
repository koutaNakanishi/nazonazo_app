# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Example User",login_id: "example",password: "foobar", password_confirmation: "foobar",admin:true)

99.times do |n|
	name=Faker::Name.name	
	login_id="example-#{n+1}"
	password="password"
	User.create!(name: name,login_id: login_id,password: password, password_confirmation: password)
end


users=User.order(:created_at).take(10)

	50.times do
	content=Faker::Lorem.sentence(4)
	answer=Faker::HarryPotter.character
	difficulty=rand(1..5)
	good_num=rand(0..1000)
	fight_num=rand(0..500)
	solved_num=rand(0..500)

	users.each{|user| user.nazos.create!(content:content,answer: answer,difficulty: difficulty,good_num: good_num,fight_num: fight_num,solved_num: solved_num)}

	end
