Course.destroy_all
User.destroy_all
Cohort.destroy_all
Quiz.destroy_all
Question.destroy_all
Response.destroy_all
Choice.destroy_all
Assessment.destroy_all


# COURSES ------------------------------------------------

#   create_table "courses", force: :cascade do |t|
#     t.string "name", null: false
#   end

course1 = Course.create({name: 'WDI'})
course2 = Course.create({name: 'UX'})
course3 = Course.create({name: 'PMI'})

# USERS --------------------------------------------------

#   create_table "users", force: :cascade do |t|
#     t.boolean  "is_instructor",          default: false, null: false
#     t.string   "f_name",                                 null: false
#     t.string   "l_name",                                 null: false
#     t.string   "email",                                  null: false
#     t.string   "password_digest",                        null: false
#     t.boolean  "is_active",              default: true,  null: false
#     t.datetime "created_at"
#     t.datetime "updated_at"
#     t.string   "invitation_token"
#     t.datetime "invitation_created_at"
#     t.datetime "invitation_sent_at"
#     t.datetime "invitation_accepted_at"
#     t.integer  "invitation_limit"
#     t.integer  "invited_by_id"
#     t.string   "invited_by_type"
#   end

instructor1 = User.create({
	f_name: 'Phil',
	l_name: 'Lamplugh',
	email: 'philco@ga.co',
	password: 'phil',
	password_confirmation: 'phil',
	is_instructor: "true"
})

instructor2 = User.create({
	f_name: 'Jaden',
	l_name: 'Carver',
	email: 'jaden.carver@ga.co',
	password: 'jaden',
	password_confirmation: 'jaden',
	is_instructor: "true"
})

instructor3 = User.create({
	f_name: 'Dennis',
	l_name: 'Liaw',
	email: 'dennis.liaw@ga.co',
	password: 'dennis',
	password_confirmation: 'dennis',
	is_instructor: "true"
})

instructor4 = User.create({
	f_name: 'Anya',
	l_name: 'Glowa-Kollisch',
	email: 'anya.glowakollisch@ga.co',
	password: 'anya',
	password_confirmation: 'anya',
	is_instructor: "true"
})

student1 = User.create({
	f_name: 'Michael',
	l_name: 'Dennis',
	email: 'michaelsdennis4@gmail.com',
	password: 'juliank',
	password_confirmation: 'juliank'
})

student2 = User.create({
	f_name: 'Gabriella',
	l_name: 'Lubliner',
	email: 'gabriella.lubliner@gmail.com',
	password: 'gab',
	password_confirmation: 'gab'
})

student3 = User.create({
	f_name: 'Junho',
	l_name: 'Rhee',
	email: 'juno0628@gmail.com',
	password: 'junho',
	password_confirmation: 'junho'
})

student4 = User.create({
	f_name: 'David',
	l_name: 'Neuhaus',
	email: 'neuhaus87@gmail.com',
	password: 'david',
	password_confirmation: 'david'
})

student5 = User.create({
	f_name: 'Devatha',
	l_name: 'Kesarkodigae',
	email: 'k.n.devs@gmail.com',
	password: 'dev',
	password_confirmation: 'dev'
})


# COHORTS ---------------------------------------------

#   create_table "cohorts", force: :cascade do |t|
#     t.integer  "course_id",                 null: false
#     t.string   "name"
#     t.date     "start_date",                null: false
#     t.date     "end_date",                  null: false
#     t.boolean  "is_active",  default: true, null: false
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

cohort1 = Cohort.create({
	name: "Blade Runner",
	course: course1,
	start_date: '2015-04-27',
	end_date: '2015-07-21'
})

cohort2 = Cohort.create({
	name: "Archer",
	course: course1,
	start_date: '2015-05-30',
	end_date: '2015-08-30'	
})

cohort3 = Cohort.create({
	name: "Skywalker",
	course: course1	,
	start_date: '2015-06-30',
	end_date: '2015-09-01'
})


# COHORTS-USERS -----------------------------------------------------

#   create_table "cohorts_users", id: false, force: :cascade do |t|
#     t.integer "user_id",   null: false
#     t.integer "cohort_id", null: false
#   end

instructor1.cohorts.append(cohort1)
instructor2.cohorts.append(cohort1)
instructor3.cohorts.append(cohort1)
instructor4.cohorts.append(cohort1)

student1.cohorts.append(cohort1)
student2.cohorts.append(cohort1)
student3.cohorts.append(cohort1)
student4.cohorts.append(cohort1)
student5.cohorts.append(cohort1)


# QUIZZES -----------------------------------------------

#   create_table "quizzes", force: :cascade do |t|
#     t.string   "title",                        null: false
#     t.string   "instructions"
#     t.boolean  "is_active",     default: true, null: false
#     t.integer  "cohort_id",                    null: false
#     t.integer  "user_id",                      null: false
#     t.datetime "created_at"
#     t.datetime "updated_at"
#     t.date     "date_assigned"
#     t.integer  "total_points"
#   end

quiz1 = Quiz.create({
	title: 'Javacript',
	instructions: 'This is a quiz about Javacript',
	cohort: cohort1,
	user: instructor1,
	date_assigned: '2015-05-01',
	total_points: 20
})

quiz2 = Quiz.create({
	title: 'Sinatra',
	instructions: 'This is a quiz about Sinatra',
	cohort: cohort1,
	user: instructor2,
	date_assigned: '2015-06-01',
	total_points: 4
})

quiz3 = Quiz.create({
	title: 'Rails',
	instructions: 'This is a quiz about Rails',
	cohort: cohort1,
	user: instructor1,
	date_assigned: '2015-06-28',
	total_points: 0
})

# QUESTIONS -------------------------------------

#   create_table "questions", force: :cascade do |t|
#     t.integer  "number",                             null: false
#     t.string   "prompt",                             null: false
#     t.boolean  "is_multiple_choice", default: false, null: false
#     t.string   "answer_key"
#     t.integer  "max_points",         default: 1,     null: false
#     t.integer  "quiz_id",                            null: false
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

# questions for quiz 1

question1 = Question.create({
	number: 1,
	prompt: 'this is the first question.',
	answer_key: 'this is the correct answer.',
	max_points: 5,
	quiz: quiz1
})

question2 = Question.create({
	number: 2,
	prompt: 'this is the second question.',
	answer_key: 'this is the correct answer.',
	max_points: 5,
	quiz: quiz1
})

question3 = Question.create({
	number: 3,
	prompt: 'this is the third question.',
	answer_key: 'this is the correct answer.',
	max_points: 5,
	quiz: quiz1
})

question4 = Question.create({
	number: 4,
	prompt: 'this is the fourth question.',
	answer_key: 'this is the correct answer.',
	max_points: 5,
	quiz: quiz1
})

# questions for quiz 2

question5 = Question.create({
	number: 1,
	prompt: 'this is the first question.',
	answer_key: 'a',
	is_multiple_choice: :true,
	max_points: 1,
	quiz: quiz2
})

question6 = Question.create({
	number: 2,
	prompt: 'this is the second question.',
	answer_key: 'b',
	is_multiple_choice: :true,
	max_points: 1,
	quiz: quiz2
})

question7 = Question.create({
	number: 3,
	prompt: 'this is the third question.',
	answer_key: 'c',
	is_multiple_choice: :true,
	max_points: 1,
	quiz: quiz2
})

question8 = Question.create({
	number: 4,
	prompt: 'this is the fourth question.',
	answer_key: 'd',
	is_multiple_choice: :true,
	max_points: 1,
	quiz: quiz2
})

# CHOICES --------------------------------------------

#   create_table "choices", force: :cascade do |t|
#     t.integer "question_id", null: false
#     t.string  "option",      null: false
#     t.string  "key",         null: false
#   end

# choices for quiz 2

choice1 = Choice.create({
	question: question5, 
	key: 'a',
	option: 'This is option a'
})

choice2 = Choice.create({
	question: question5, 
	key: 'b',
	option: 'This is option b'
})

choice3 = Choice.create({
	question: question5, 
	key: 'c',
	option: 'This is option c'
})

choice4 = Choice.create({
	question: question5, 
	key: 'd',
	option: 'This is option d'
})

choice5 = Choice.create({
	question: question6, 
	key: 'a',
	option: 'This is option a'
})

choice6 = Choice.create({
	question: question6, 
	key: 'b',
	option: 'This is option b'
})

choice7 = Choice.create({
	question: question6, 
	key: 'c',
	option: 'This is option c'
})

choice8 = Choice.create({
	question: question6, 
	key: 'd',
	option: 'This is option d'
})

choice9 = Choice.create({
	question: question7, 
	key: 'a',
	option: 'This is option a'
})

choice10 = Choice.create({
	question: question7, 
	key: 'b',
	option: 'This is option b'
})

choice11 = Choice.create({
	question: question7, 
	key: 'c',
	option: 'This is option c'
})

choice12 = Choice.create({
	question: question7, 
	key: 'd',
	option: 'This is option d'
})

choice13 = Choice.create({
	question: question8, 
	key: 'a',
	option: 'This is option a'
})

choice14 = Choice.create({
	question: question8, 
	key: 'b',
	option: 'This is option b'
})

choice15 = Choice.create({
	question: question8, 
	key: 'c',
	option: 'This is option c'
})

choice16 = Choice.create({
	question: question8, 
	key: 'd',
	option: 'This is option d'
})

# RESPONSES ---------------------------------------------

#   create_table "responses", force: :cascade do |t|
#     t.integer  "user_id",     null: false
#     t.integer  "question_id", null: false
#     t.string   "answer"
#     t.integer  "grade"
#     t.string   "comment"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

# responses for quiz 1, question 1

response1 = Response.create({
	user: student1,
	question: question1,
	answer: 'this is my answer.',
	grade: 3,
	comment: 'this is the instructor comment'
})

response2 = Response.create({
	user: student2,
	question: question1,
	answer: 'this is my answer.',
	grade: 4,
	comment: 'this is the instructor comment'
})

response3 = Response.create({
	user: student3,
	question: question1,
	answer: 'this is my answer.',
	grade: 3,
	comment: 'this is the instructor comment'
})

response4 = Response.create({
	user: student4,
	question: question1,
	answer: 'this is my answer.',
	grade: 2,
	comment: 'this is the instructor comment'
})

response5 = Response.create({
	user: student5,
	question: question1,
	answer: 'this is my answer.',
	grade: 5,
	comment: 'this is the instructor comment'
})

# responses for quiz 1, question 2

response6 = Response.create({
	user: student1,
	question: question2,
	answer: 'this is my answer.',
	grade: 2,
	comment: 'this is the instructor comment'
})

response7 = Response.create({
	user: student2,
	question: question2,
	answer: 'this is my answer.',
	grade: 3,
	comment: 'this is the instructor comment'
})

response8 = Response.create({
	user: student3,
	question: question2,
	answer: 'this is my answer.',
	grade: 5,
	comment: 'this is the instructor comment'
})

response9 = Response.create({
	user: student4,
	question: question2,
	answer: 'this is my answer.',
	grade: 4,
	comment: 'this is the instructor comment'
})

response10 = Response.create({
	user: student5,
	question: question2,
	answer: 'this is my answer.',
	grade: 3,
	comment: 'this is the instructor comment'
})

# responses for quiz 1, question 3

response11 = Response.create({
	user: student1,
	question: question3,
	answer: 'this is my answer.',
	grade: 5,
	comment: 'this is the instructor comment'
})

response12 = Response.create({
	user: student2,
	question: question3,
	answer: 'this is my answer.',
	grade: 4,
	comment: 'this is the instructor comment'
})

response13 = Response.create({
	user: student3,
	question: question3,
	answer: 'this is my answer.',
	grade: 3,
	comment: 'this is the instructor comment'
})

response14 = Response.create({
	user: student4,
	question: question3,
	answer: 'this is my answer.',
	grade: 4,
	comment: 'this is the instructor comment'
})

response15 = Response.create({
	user: student5,
	question: question3,
	answer: 'this is my answer.',
	grade: 5,
	comment: 'this is the instructor comment'
})


# responses for quiz 1, question 4

response16 = Response.create({
	user: student1,
	question: question4,
	answer: 'this is my answer.',
	grade: 3,
	comment: 'this is the instructor comment'
})

response17 = Response.create({
	user: student2,
	question: question4,
	answer: 'this is my answer.',
	grade: 4,
	comment: 'this is the instructor comment'
})

response18 = Response.create({
	user: student3,
	question: question4,
	answer: 'this is my answer.',
	grade: 5,
	comment: 'this is the instructor comment'
})

response19 = Response.create({
	user: student4,
	question: question4,
	answer: 'this is my answer.',
	grade: 5,
	comment: 'this is the instructor comment'
})

response20 = Response.create({
	user: student5,
	question: question4,
	answer: 'this is my answer.',
	grade: 3,
	comment: 'this is the instructor comment'
})


# ASSESSMENTS ----------------------------------------------

# create_table "assessments", force: :cascade do |t|
#     t.integer "user_id",                             null: false
#     t.integer "quiz_id",                             null: false
#     t.integer "student_score"
#     t.string  "comment"
#     t.string  "status",        default: "submitted"
#   end

# assessments for quiz 1

assessment1 = Assessment.create({
	user: student1,
	quiz: quiz1,
	student_score: Response.where({user: student1, question: quiz1.questions}).sum('grade'),
	comment: 'this is the assessment comment.',
	status: 'graded'
})

assessment2 = Assessment.create({
	user: student2,
	quiz: quiz1,
	student_score: Response.where({user: student2, question: quiz1.questions}).sum('grade'),
	comment: 'this is the assessment comment.',
	status: 'graded'
})

assessment3 = Assessment.create({
	user: student3,
	quiz: quiz1,
	student_score: Response.where({user: student3, question: quiz1.questions}).sum('grade'),
	comment: 'this is the assessment comment.',
	status: 'graded'
})

assessment4 = Assessment.create({
	user: student4,
	quiz: quiz1,
	student_score: Response.where({user: student4, question: quiz1.questions}).sum('grade'),
	comment: 'this is the assessment comment.',
	status: 'graded'
})

assessment5 = Assessment.create({
	user: student5,
	quiz: quiz1,
	student_score: Response.where({user: student5, question: quiz1.questions}).sum('grade'),
	comment: 'this is the assessment comment.',
	status: 'graded'
})

# assessments for quiz 2

assessment6 = Assessment.create({
	user: student1,
	quiz: quiz2,
})

assessment7 = Assessment.create({
	user: student2,
	quiz: quiz2,
})

assessment8 = Assessment.create({
	user: student3,
	quiz: quiz2,
})

assessment9 = Assessment.create({
	user: student4,
	quiz: quiz2,
})

assessment10 = Assessment.create({
	user: student5,
	quiz: quiz2,
})
