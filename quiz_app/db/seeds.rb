# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# 5.times do |i|
# 	Quiz.create(title: "")

quiz1 = Quiz.create(title: "first quiz", instructions: "please solve all quiz and submit it", is_active: true, cohort_id: 1, user_id: 2)

question1 = quiz1.Questions.create(number: 1, prompt: "what is nickname of nyc?", is_multiple_choice: false, answer_key: "big apple", max_points: 5, quiz_id: 1)


response 1 = question1.Responses.create(user_id: 2, question_id: 1, answer: "hello", grade: 0, comment: "this was tough man")


