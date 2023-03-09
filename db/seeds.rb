# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "uri"



puts "cleaning up the database"

User.destroy_all
Room.destroy_all
Question.destroy_all



puts "creating six fake users"
6.times do 
  user = User.new(
    username: Faker::Name.name.to_s,
    email: Faker::Internet.email.to_s,
    password: Faker::Internet.password.to_s
  )
  file = URI.open("https://res.cloudinary.com/dzotx5j9x/image/upload/v1678275332/development/qk3v9cmx5y49f391uh2jwrn26sbb.jpg")
  user.photo.attach(io: file, filename: "file_name")
  user.save!
end
puts "#{User.count} users were created."
puts "..."
puts "creating the 3 main questions with 4 answers each for first round"

first_question = Question.create(content: "What kind of weather do you prefer", round: 1)
first_answer = Answer.new(content: "Endless Rain")
first_answer.question = first_question
first_answer.save!
second_answer = Answer.new(content: "Boiling Heat")
second_answer.question = first_question
second_answer.save!
third_answer = Answer.new(content: "Freezing Cold")
third_answer.question = first_question
third_answer.save!
fourth_answer = Answer.new(content: "Horrible Humidity")
fourth_answer.question = first_question
fourth_answer.save!

second_question = Question.create(content: "What is your favorite color?", round: 1)
first_answer = Answer.new(content: "Red")
first_answer.question = second_question
first_answer.save!
second_answer = Answer.new(content: "Blue")
second_answer.question = second_question
second_answer.save!
third_answer = Answer.new(content: "Green")
third_answer.question = second_question
third_answer.save!
fourth_answer = Answer.new(content: "Yellow")
fourth_answer.question = second_question
fourth_answer.save!

third_question = Question.create(content: "What is your favorite animal?", round: 1)
first_answer = Answer.new(content: "Elefant")
first_answer.question = third_question
first_answer.save!
second_answer = Answer.new(content: "Crocodile")
second_answer.question = third_question
second_answer.save!
third_answer = Answer.new(content: "Cat")
third_answer.question = third_question
third_answer.save!
fourth_answer = Answer.new(content: "Pig")
fourth_answer.question = third_question
fourth_answer.save!

puts "..."
puts "creating the 3 main questions with no answers for second round"
Question.create(content: "Who likes endless rain?", round: 2)
Question.create(content: "Whose favorite color is blue?", round: 2)
Question.create(content: "Who likes crocodiles?", round: 2)

puts "All done!"
puts "#{Question.where(round: 1).count} questions were created for the first round. #{Answer.count} were created and are attached to those questions, 4 for question"
puts "..."
puts "#{Question.where(round: 2).count} questions were created for the second round."
puts "Good luck with the project!"