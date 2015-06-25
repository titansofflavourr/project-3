var question_id = "";


$('.student-quiz-submit-button').on('click',function(event) {
	// event.preventDefault(); 
	console.log($(this));
	var answer_input = $(this).parent().children().first()
	var answer = answer_input.val();
	question_id = parseInt(answer_input.attr('class'));
	console.log("button clicked");
	post_new_answer(answer, question_id);
	//hide submit answer button and reveal edit button 
	$(this).addClass('hidden');
	$(this).next().removeClass('hidden');
	//show answer submitted comment  
	$(this).parent().children().last().prev().removeClass("hidden");
});

var post_new_answer = function(answer, question_id) {
	// var quiz_id = parseInt($('.quiz_id').text());

	//passing on answer and question_id to server
	$.ajax({
		url: '/responses',
		type: 'POST',
		data: {
			answer: answer,  
			question_id: question_id
		}
	//receive json result
	//change inputbox as disabled, hide button and show as submitted 
	}).done(function(data) {
		var new_question_id = "'."+data.question_id+"'";
		var new_response_id = data.id;
		$(new_question_id).attr(id, new_response_id)
	})
};


//enable editing answer 
$('.student-quiz-edit-button').on('click', function() {
	$(this).parent().children().first().prop("disabled",false);
	$(this).addClass("hidden");
	$(this).next().removeClass("hidden");
	$(this).parent().children().last().prev().addClass("hidden");
})


//updating answer after changing input box 

$('.student-quiz-update-button').on('click', function() {
	console.log($(this));
	var answer_input = $(this).parent().children().first()
	var answer = answer_input.val();
	question_id = parseInt($(this).parent().children().first().attr('class'));
	console.log("button clicked");
	var response_id = answer_input.attr('id');
	console.log(response_id);
	post_update_answer(answer, question_id, response_id);
	$(this).addClass("hidden");
	$(this).prev().removeClass("hidden");
	$(this).parent().children().first().prop("disabled",true);
	$(this).parent().children().last().prev().removeClass("hidden");
})


var post_update_answer = function(answer, question_id, response_id) {
	$.ajax({
		url: '/responses/'+ response_id,
		type: 'PATCH',
		data: {
			answer: answer,  
			question_id: question_id
		}
	}).done(function(data) {
		console.log(data);
	})
}
