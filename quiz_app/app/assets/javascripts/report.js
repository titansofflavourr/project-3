console.log('report.js linked');

var selectCohort = document.querySelector("#select_cohort");

var cohort = function(event) {
	event.preventDefault();
	var parameters = $('#select_cohort').serializeArray();
	console.log(parameters);
	$.ajax({
		url: "cohorts/report",
		type: "GET",
		dataType: "json",
		data: parameters,
		success: function(result) {
			var output = Mustache.render($('#cohort_template').html(), result);
			$("#cohort_report").html(output);
			var selectQuiz = document.querySelector("#select_quiz");
			var selectStudent = document.querySelector("#select_student");
			selectQuiz.addEventListener("change", quiz);
			selectStudent.addEventListener("change", student);
		},
		error: function() {
			window.alert("Please select a cohort.");
		}
	});
};

var quiz = function(event) {
	event.preventDefault();
	var parameters = $('#select_quiz').serializeArray();
	$.ajax({
		url: "quizzes/report",
		type: "GET",
		dataType: "json",
		data: parameters,
		success: function(result) {
			var output = Mustache.render($('#quiz_template').html(), result);
			$("#quiz_report").html(output);	
		},
		error: function() {
			window.alert("Please select a quiz.");
		}
	});
};

var student = function(event) {
	event.preventDefault();
	var parameters = $('#select_student').serializeArray();
	$.ajax({
		url: "users/report",
		type: "GET",
		dataType: "json",
		data: parameters,
		success: function(result) {
			console.log(result);
			var output = Mustache.render($('#student_template').html(), result);
			$("#student_report").html(output);	
		},
		error: function() {
			window.alert("Please select a student.");
		}
	});
};

if (selectCohort) {
	selectCohort.addEventListener("change", cohort);
};