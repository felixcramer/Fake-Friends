# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "uri"

puts "Cleaning up the database!"

User.destroy_all
Room.destroy_all
Question.destroy_all

puts "Creating six fake users!"
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
puts "Creating the 4 main questions with 4 answers each for first round."

first_question = Question.create(content: "What pet would you most like to have?", round: 1, key_words: "ideal pet")
first_answer = Answer.new(content: "Dog")
first_answer.question = first_question
first_answer.save!
second_answer = Answer.new(content: "Cat")
second_answer.question = first_question
second_answer.save!
third_answer = Answer.new(content: "Frog")
third_answer.question = first_question
third_answer.save!
fourth_answer = Answer.new(content: "Rat")
fourth_answer.question = first_question
fourth_answer.save!

second_question = Question.create(content: "What's your biggest fear?", round: 1, key_words: "biggest fear")
first_answer = Answer.new(content: "Spiders")
first_answer.question = second_question
first_answer.save!
second_answer = Answer.new(content: "Heights")
second_answer.question = second_question
second_answer.save!
third_answer = Answer.new(content: "Dark")
third_answer.question = second_question
third_answer.save!
fourth_answer = Answer.new(content: "Coding")
fourth_answer.question = second_question
fourth_answer.save!

third_question = Question.create(content: "What food could you not live without?", round: 1, key_words: "most important food")
first_answer = Answer.new(content: "Cheese")
first_answer.question = third_question
first_answer.save!
second_answer = Answer.new(content: "Potatoes")
second_answer.question = third_question
second_answer.save!
third_answer = Answer.new(content: "Pasta")
third_answer.question = third_question
third_answer.save!
fourth_answer = Answer.new(content: "Rice")
fourth_answer.question = third_question
fourth_answer.save!

fourth_question = Question.create(content: "If you had to choose, which sense would you give up?", round: 1, key_words: "least important sense")
first_answer = Answer.new(content: "Hearing")
first_answer.question = fourth_question
first_answer.save!
second_answer = Answer.new(content: "Sight")
second_answer.question = fourth_question
second_answer.save!
third_answer = Answer.new(content: "Touch")
third_answer.question = fourth_question
third_answer.save!
fourth_answer = Answer.new(content: "Taste")
fourth_answer.question = fourth_question
fourth_answer.save!

puts "All done!"
puts "#{Question.where(round: 1).count} questions were created for the first round. #{Answer.count} were created and are attached to those questions, 4 for question."
puts "..."
puts "Good luck with the project!"
