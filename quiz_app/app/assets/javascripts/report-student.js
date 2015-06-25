console.log('report.js linked');

var selectCohort = document.querySelector("#class_select");

selectCohort.addEventListener("change", function(event) {
	event.preventDefault();
	var parameters = $('#class_select').serializeArray();
	console.log(parameters);
	$.ajax({
			url: "cohorts/report",
			type: "GET",
			dataType: "json",
			data: parameters,
			success: function(result) {
				var output = Mustache.render($('#class_template').html(), result);
				$("#class_report").html(output);
				$('[name="quizzes-taken"]').val(result.quiz_count)
				var output = Mustache.render($('#cohort_template').html(), result);
				$("#cohort_people").html(output);
				var output = Mustache.render($('#student_template').html(), result);
				$("#student_report").html(output);
			},
			error: function() {
				window.alert("Oops, there was a problem with the cohort request.");
			}
		});

});

