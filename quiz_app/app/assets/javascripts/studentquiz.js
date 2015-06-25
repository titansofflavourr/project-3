var question_id = "";


$('button').on('click',function(event) {
	// event.preventDefault(); 
	console.log($(this))
	var answer = $(this).parent().children().first().val();
	question_id = parseInt($(this).parent().children().first().attr('class'));
	console.log("button clicked");
	post_new_answer(answer, question_id);
	$(this).hide();
	$(this).parent().children().last().prev().attr('class','show');
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
		console.log(data);
	})
};
