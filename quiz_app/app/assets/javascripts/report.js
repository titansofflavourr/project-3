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
			var output = Mustache.render($('#student_template').html(), result);
			$("#student_report").html(output);
			var selectQuiz = document.querySelector("#select_quiz");
			for (var i=0; i < result.student_averages; i++) {
				var id = result.student_averages[i].id
				var td = document.querySelector(".student_average#"+id);
				td.textContent = result.student_averages[i].student_average;
			};
			selectQuiz.addEventListener("change", quiz);
		},
		error: function() {
			window.alert("Please select a cohort.");
		}
	});
};

var quiz = function(event) {
	event.preventDefault();
	var parameters = $('#select_quiz').serializeArray();
	console.log(parameters);
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

if (selectCohort) {
	selectCohort.addEventListener("change", cohort);
};