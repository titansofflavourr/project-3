# Examples:
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# empty tables, but doesn't reset ID
Course.destroy_all
User.destroy_all
Cohort.destroy_all
Quiz.destroy_all
Question.destroy_all
Response.destroy_all
Choice.destroy_all

#creating course
course_1 = Course.create(name: "Web_Development_Immersive")

course_2 = Course.create(name: "UX")

course_3 = Course.create(name: "Project_Management")

cohort1 = Cohort.create(course: course_1, name: "Melville", start_date: "2015-04-27", end_date: "2015-07-21", is_active: true)

# add users to cohort 1 after fixing schema

user_1 = User.create(is_instructor: true, f_name: "Junho", l_name: "Rhee", email: "juno0628@gmail.com", password: "password", password_confirmation: "password")

user_2 = User.create(is_instructor: false, f_name: "Deke", l_name: "k", email: "k.n.devs@gmail.com", password: "password", password_confirmation: "password")

user_1 = User.create(is_instructor: false, f_name: "David", l_name: "Newhaus", email: "jewhaus@gmail.com", password: "password", password_confirmation: "password")


quiz1 = Quiz.create(title: "first quiz about HTML", instructions: "please solve all the questions and submit it. If you have any issues, please leave a comment", is_active: true, cohort: cohort1, user: user_1)

quiz2 = Quiz.create(title: "first quiz about HTML", instructions: "please solve all the questions and submit it. If you have any issues, please leave a comment", is_active: true, cohort: cohort1, user: user_1)

quiz3 = Quiz.create(title: "second quiz about Ruby", instructions: "please solve all the questions and submit it. If you have any issues, please leave a comment", is_active: true, cohort: cohort1, user: user_1)

question1 = Question.create(number: 1, prompt: "what does HTML stand for?", is_multiple_choice: false, answer_key: "big apple", max_points: 5, quiz: quiz1)


response1 = Response.create(user: user_2, question: question1, answer: "Hypertext blah", grade: 3, comment: "this was tough man")


question2 = Question.create(number: 2, prompt: "what's the advantage of semantic language?", is_multiple_choice: false, answer_key: "easy to comprehend", max_points: 5, quiz: quiz1)


response2 = Response.create(user: user_2, question: question1, answer: "Easy to understand", grade: 5, comment: "this was easy")

question3 = Question.create(number: 1, prompt: "Who created Ruby?", is_multiple_choice: false, answer_key: "Yukihiro Matsumoto", max_points: 5, quiz: quiz2)

response3 = Response.create(user_id: 2, question_id: question1.id, answer: "Matsu", grade: 5, comment: "nothing")

question4 = Question.create(number: 4, prompt: "what is one of Ruby framework?", is_multiple_choice: true, answer_key: "c", max_points: 3, quiz: quiz1)

choice1 = Choices.create(question: question4, key: "A", option: "Node")

choice2 = Choices.create(question: question4, key: "B", option: "MongoDB")

choice3 = Choices.create(question: question4, key: "C", option: "Rails")

choice4 = Choices.create(question: question4, key: "D", option: "Postgres")





