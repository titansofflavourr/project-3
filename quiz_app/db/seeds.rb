# Examples:
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



#creating course
Course.create(name: "Web_Development_Immersive")

Course.create(name: "UX")

Course.create(name: "Project_Management")

cohort1 = Cohort.create(course_id: 1, name: "Melville", start_date: "2015-04-27", end_date: "2015-07-21", is_active: true)

# add users to cohort 1 after fixing schema

User.create(is_instructor: true, f_name: "Junho", l_name: "Rhee", email: "juno0628@gmail.com", password: "password", password_confirmation: "password")

User.create(is_instructor: false, f_name: "Deke", l_name: "k", email: "k.n.devs@gmail.com", password: "password", password_confirmation: "password")

User.create(is_instructor: false, f_name: "David", l_name: "Newhaus", email: "jewhaus@gmail.com", password: "password", password_confirmation: "password")


quiz1 = Quiz.create(title: "first quiz about HTML", instructions: "please solve all the questions and submit it. If you have any issues, please leave a comment", is_active: true, cohort_id: 1, user_id: 2)

quiz2 = Quiz.create(title: "first quiz about HTML", instructions: "please solve all the questions and submit it. If you have any issues, please leave a comment", is_active: true, cohort_id: 1, user_id: 3)

quiz3 = Quiz.create(title: "second quiz about Ruby", instructions: "please solve all the questions and submit it. If you have any issues, please leave a comment", is_active: true, cohort_id: 1, user_id: 2)

question1 = Question.create(number: 1, prompt: "what does HTML stand for?", is_multiple_choice: false, answer_key: "big apple", max_points: 5, quiz_id: 1)


response1 = Response.create(user_id: 2, question_id: 1, answer: "Hypertext blah", grade: 3, comment: "this was tough man")


question2 = Question.create(number: 2, prompt: "what's the advantage of semantic language?", is_multiple_choice: false, answer_key: "easy to comprehend", max_points: 5, quiz_id: 1)


response2 = Response.create(user_id: 2, question_id: 1, answer: "Easy to understand", grade: 5, comment: "this was easy")

question2 = Question.create(number: 1, prompt: "Who created Ruby?", is_multiple_choice: false, answer_key: "Yukihiro Matsumoto", max_points: 5, quiz_id: 1)

response3 = Response.create(user_id: 2, question_id: 1, answer: "Matsu", grade: 5, comment: "nothing")


