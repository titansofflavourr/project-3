# project-3
WDI Project 3 - Quiz Builder

Create and share quizzes for class.

Team members
  - Michael Dennis - https://www.github.com/michaelsdennis4
  - Junho Rhee - https://www.github.com/juno0628
  - David Neuhaus - https://www.github.com/neuhausneuhaus
  - Gabriella Lubliner - https://www.github.com/poele
  - Devatha Kesarkodigae - https://www.github.com/deksr
  
Technologies
  - Devise Invitable - https://github.com/scambra/devise_invitable
  - jQuery
  - mustache.js
  - RedCarpet - https://github.com/vmg/redcarpet
  
Trello - https://trello.com/b/dpKWLosa/wdi-project-3
Artifacts & ERD's - see Trello (above)
Wireframes - https://github.com/titansofflavourr/project-3/tree/master/wireframes

====================================================================================================

Instructor Portal

When an instructor logs in they should have a dashboard that has a link to create a new quiz, lists quizzes they've created, and displays notifications about quizzes students have taken that need to be graded.

Instructors should be able to look at an individual student's performance on a specific quiz, as well as throughout the course.

Instructors should be able to look at their class's total performance on a specific quiz, as well as thoughout the course.

Quiz Creation

An instructor can log in and create a new quiz for a class.

An instructor can invite students to sign up for the app.

Quizzes may have multiple choice or free-form answers.

The questions may be formatted in Markdown to allow code snippets.

An instructor may browse quizzes created by other instructors and assign them to their class.

Student Portal

When a student logs in they should be able to view their old quizzes and see their past scores and progess, using graphics that help them understand the data.
Quiz Taking

If a quiz has been assigned for that day, a student can go directly to it by visiting /quiz. If a quiz hasn't been assigned for that day, /quiz should say so.
The Signup Process

When an instructor creates a new class through the Quiz app, each student should receive an email with a link back to the app for them to either sign up or login. (If they've already taken a class at GA, they should be able to log in with the same account).
