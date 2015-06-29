console.log("student-quiz linked")

var question_id = "";

var student_return_quiz_page = document.querySelector('.student-return-quiz-page');

if(student_return_quiz_page) {$('.student-quiz-submit-button').on('click',function(event) {
		// event.preventDefault(); 
		console.log($(this));
		var answer_input = $(this).parent().find('input');
		var answer = answer_input.val();
		question_id = parseInt(answer_input.attr('class'));
		console.log("button clicked");
		post_new_answer(answer, question_id);
		//hide submit answer button, reveal edit button and disable answer input 
		$(this).addClass('hidden');
		$(this).next().removeClass('hidden');
		answer_input.prop('disabled',true);
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
			var new_question_id = data.question_id
			var new_response_id = data.id;
			$('.'+new_question_id).attr("id", new_response_id);
		})
	};


	//enable editing answer 
	$('.student-quiz-edit-button').on('click', function() {
		$(this).parent().find('input').prop("disabled",false);
		$(this).addClass("hidden");
		$(this).next().removeClass("hidden");
		$(this).parent().children().last().prev().addClass("hidden");
	})


	//updating answer after changing input box 

	$('.student-quiz-update-button').on('click', function() {
		console.log($(this));
		var answer_input = $(this).parent().find('input');
		var answer = answer_input.val();
		question_id = parseInt($(this).parent().find('input').attr('class'));
		console.log("button clicked");
		var response_id = answer_input.attr('id');
		console.log(response_id);
		post_update_answer(answer, question_id, response_id);
		$(this).addClass("hidden");
		$(this).prev().removeClass("hidden");
		$(this).parent().find('input').prop("disabled",true);
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


	////multiple choice question

	$('.student-quiz-multiple-choice-submit-button').on('click',function(event) {
		// event.preventDefault(); 
		console.log($(this));
		//retreive choice letter from checked using charcode conversion
		var checked_choice = $(this).parent().find(':checked');  
		var choice_letter = checked_choice.next().text().slice(0,1);

		question_id = parseInt(checked_choice.attr('class'));
		console.log("multiple-choice-button clicked");
		post_multiple_choice_new_answer(choice_letter, question_id);
		//hide submit answer button and reveal edit button 
		$(this).addClass('hidden');
		$(this).next().removeClass('hidden');
		//show answer submitted comment  
		$(this).parent().children().last().prev().removeClass("hidden");
		//disable multi-choice options 
		$(this).parent().find('input[type=radio]').attr('disabled',true);
	});

	var post_multiple_choice_new_answer = function(choice_letter, question_id) {
		// var quiz_id = parseInt($('.quiz_id').text());
		//passing on answer and question_id to server
		$.ajax({
			url: '/responses',
			type: 'POST',
			data: {
				answer: choice_letter,  
				question_id: question_id
			}
		//receive json result
		//change inputbox as disabled, hide button and show as submitted 
		}).done(function(data) {
			var new_question_id = data.question_id
			var new_response_id = data.id;
			var new_response_letter = data.answer;
			$('.'+new_question_id).attr('id', new_response_id);
		})
	};



	$('.student-quiz-multiple-choice-edit-button').on('click', function() {

			console.log('edit button clicked');
		$(this).parent().find('input[type=radio]').attr('disabled',false);
		$(this).addClass("hidden");
		$(this).next().removeClass("hidden");
		$(this).parent().children().last().prev().addClass("hidden");
	})



	$('.student-quiz-multiple-choice-update-button').on('click', function() {
		var checked_choice = $(this).parent().find(':checked');  
		var choice_letter = checked_choice.next().text().slice(0,1);

		question_id = parseInt($(this).parent().find('input').attr('class'));
		var response_id = checked_choice.attr('id');
		post_update_answer(choice_letter, question_id, response_id);
		$(this).addClass("hidden");
		$(this).prev().removeClass("hidden");
			//disable multi-choice options 
		$(this).parent().find('input[type=radio]').attr('disabled',true);

		$(this).parent().children().last().prev().removeClass("hidden");
	})


	var post_multiple_choice_update_answer = function(answer, question_id, response_id) {
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

	$('.student-complete-quiz-page').click(function( ){
	 //ajax call to assessment
	 console.log('clicked');
	 var blanks = []
		var count = $('.short-answer-field')
		for (var i = 0; i < count.length; i ++) {
    blanks.push($(count[i]).attr('class').split(' ')[1])
		}

	 var quiz_id = $('.student-quiz-title').attr('id')
	 var url = '/quizzes/'+ quiz_id + '/assessments' 
		$.ajax({
			type: 'POST',
			url: url,
			data:{
				quiz_id: quiz_id,
				blanks: blanks
			}
		}).done(function(data){
			console.log('ajax finished');
		})

		//after submitting, change view for complete//
		$(this).addClass("hidden");
		$('.student-take-quiz-view').addClass("hidden");
		$('.student-submitted-quiz-view').append('<p> THANK YOU FOR TAKING QUIZ.</p>');
	})
}
