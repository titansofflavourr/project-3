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
Assessment.destroy_all

#creating course
course_1 = Course.create(name: "WDI")

course_2 = Course.create(name: "UXDI")

course_3 = Course.create(name: "PMI")

cohort1 = Cohort.create(course: course_1, name: "Melville", start_date: "2015-04-27", end_date: "2015-07-21", is_active: true)

cohort2 = Cohort.create(course: course_3, name: "Saruman", start_date: "2013-09-27", end_date: "2014-01-27", is_active: false)

# add users to cohort 1 after fixing schema

user_1 = User.create(is_instructor: true, f_name: "Junho", l_name: "Rhee", email: "juno0628@gmail.com", password: "password", password_confirmation: "password")

user_2 = User.create(is_instructor: false, f_name: "Deke", l_name: "k", email: "k.n.devs@gmail.com", password: "password", password_confirmation: "password")

user_3 = User.create(is_instructor: true, f_name: "David", l_name: "Newhaus", email: "jewhaus@gmail.com", password: "password", password_confirmation: "password")

user_4 = User.create(is_instructor: false, f_name: "Michael", l_name: "Finnagan", email: "whiskerismychine@gmail.com", password: "password", password_confirmation: "password")

user_5 = User.create(is_instructor: false, f_name: "Gab", l_name: "Lubliner", email: "gabriella.lubliner@gmail.com", password: "password", password_confirmation: "password")

user_6 = User.create(is_instructor: true, f_name: "Nathan", l_name: "Drake", email: "beencaughtstealing@gmail.com", password: "password", password_confirmation: "password")

user_7 = User.create(is_instructor: true, f_name: "Booker", l_name: "DeWitt", email: "washawaythedebt@gmail.com", password: "password", password_confirmation: "password")

quiz1 = Quiz.create(title: "first quiz about HTML", instructions: "please solve all the questions and submit it. If you have any issues, please leave a comment", is_active: true, cohort: cohort1, user: user_1)

quiz2 = Quiz.create(title: "first quiz about HTML", instructions: "please solve all the questions and submit it. If you have any issues, please leave a comment", is_active: true, cohort: cohort1, user: user_1)

quiz3 = Quiz.create(title: "second quiz about Ruby", instructions: "please solve all the questions and submit it. If you have any issues, please leave a comment", is_active: true, cohort: cohort1, user: user_1)

question1 = Question.create(number: 1, prompt: "what does HTML stand for?", is_multiple_choice: false, answer_key: "big apple", max_points: 5, quiz: quiz1)


response1 = Response.create(user: user_2, question: question1, answer: "Hypertext blah", comment: "this was tough man")


question2 = Question.create(number: 2, prompt: "what's the advantage of semantic language?", is_multiple_choice: false, answer_key: "easy to comprehend", max_points: 5, quiz: quiz1)


response2 = Response.create(user: user_2, question: question2, answer: "Easy to understand", comment: "this was easy")


question3 = Question.create(number: 1, prompt: "Who created Ruby?", is_multiple_choice: false, answer_key: "Yukihiro Matsumoto", max_points: 5, quiz: quiz2)

response3 = Response.create(user: user_4, question_id: question1.id, answer: "Matsu", comment: "nothing")

question4 = Question.create(number: 4, prompt: "what is one of Ruby framework?", is_multiple_choice: true, answer_key: "c", max_points: 3, quiz: quiz1)

response10 = Response.create(user: user_2, question: question4, answer: "C")

choice1 = Choice.create(question: question4, key: "A", option: "Node")

choice2 = Choice.create(question: question4, key: "B", option: "MongoDB")

choice3 = Choice.create(question: question4, key: "C", option: "Rails")

choice4 = Choice.create(question: question4, key: "D", option: "Express")

question5 = Question.create(number: 5, prompt: 'What is database?',is_multiple_choice: true, answer_key: "A", max_points: 5, quiz: quiz1)

choice1 = Choice.create(question: question5, key: "A", option: "Database is where you store data")

choice2 = Choice.create(question: question5, key: "B", option: "Database is base of data")

choice3 = Choice.create(question: question5, key: "C", option: "Database is just data in the basement")

question6 = Question.create(number: 6, prompt: "This okay?", is_multiple_choice: true, answer_key: "B", max_points: 15, quiz: quiz2)

choice1 = Choice.create(question: question6, key: "A", option: "hell no go away")

choice2 = Choice.create(question: question6, key: "B", option: "easy to comprehend")

choice3 = Choice.create(question: question6, key: "C", option: "beans")

question7 = Question.create(number: 7, prompt: "This is why Gab never writes seeds files?", is_multiple_choice: false, max_points: 10, quiz: quiz3)

response11 = Response.create(user: user_5, question: question7, answer: "Pretty much, actually.")

question8 = Question.create(number: 8, prompt: "This is why Gab never writes seeds files?", is_multiple_choice: false, max_points: 10, quiz: quiz3)

question9 = Question.create(number: 9, prompt: "This is why Gab never writes seeds files?", is_multiple_choice: false, max_points: 10, quiz: quiz3)

question10 = Question.create(number: 10, prompt: "This is why Gab never writes seeds files?", is_multiple_choice: false, max_points: 10, quiz: quiz3)

question11 = Question.create(number: 11, prompt: 'What is database?',is_multiple_choice: true, answer_key: "A", max_points: 5, quiz: quiz1)

choice1 = Choice.create(question: question11, key: "A", option: "Database is where you store data")

choice2 = Choice.create(question: question11, key: "B", option: "Database is base of data")

choice3 = Choice.create(question: question11, key: "C", option: "Database is just data in the basement")

question12 = Question.create(number: 12, prompt: 'What is database?',is_multiple_choice: true, answer_key: "A", max_points: 5, quiz: quiz1)

choice1 = Choice.create(question: question12, key: "A", option: "Database is where you store data")

choice2 = Choice.create(question: question12, key: "B", option: "Database is base of data")

choice3 = Choice.create(question: question12, key: "C", option: "Database is just data in the basement")


ass2 = Assessment.create(user: user_3, quiz: quiz1, student_score: 18, comment: "Almost perfect!")

ass3 = Assessment.create(user: user_4, quiz: quiz1, student_score: 13, comment: "Keep it up!")

ass4 = Assessment.create(user: user_5, quiz: quiz1, student_score: 15, comment: "Great!")

ass5 = Assessment.create(user: user_5, quiz: quiz3, student_score: 11, comment: "Hey good job!")

ass6 = Assessment.create(user: user_4, quiz: quiz3, student_score: 20, comment: "Perfect.")
