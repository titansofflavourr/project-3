console.log('report.js linked');

var selectCohort = document.querySelector("#select_cohort");

selectCohort.addEventListener("change", function(event) {
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
			},
			error: function() {
				window.alert("Oops, there was a problem with the cohort request.");
			}
		});

});