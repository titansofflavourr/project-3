console.log("quiz_creation js is linked up");

// ==========QUIZ-CREATION/EDIT=============

// ------Question-Submit(to-db-and-DOM)-----
// var newChoice = function(event){
//   event.preventDefault();
//   var parameters = $('.new-question-form').serializeArray();
//             // ------db-----
//   console.log('executing ajx query now');
//   console.log(parameters);
//   $.ajax({
//     url: '/addquestion',
//     type: 'POST',
//     data: parameters,
//     dataType: 'json'
//   }).done(function(result) {
//     window.alert('executed successfully');
//     // var template = $("#new-question-template").html();
//     // var html = Mustache.render(template, result);
//     // $( "#quiz-questions" ).append(html); //appends     
//     // $( ":text" ).val(""); //clears text inputs for next question
//   });
// }

// addQuestionButton = document.querySelector(".add-question-button");

// $( ".add-question-button").click( function(event){
//   event.preventDefault();
//   var parameters = $('.new-question-form').serializeArray();
//             // ------db-----
//   console.log('executing ajx query now');
//   console.log(parameters);
//   $.ajax({
//     url: "/questions",
//     type: "POST",
//     data: parameters,
//     dataType: "json",
//     success: function(result) {
//       var output = Mustache.render($("#new-question-template").html(), result);
//       $("#quiz-questions").append(output);
//       // var template = $("#new-question-template").html();
//       // var html = Mustache.render(template, result);
//       // $( "#quiz-questions" ).append(html); //appends     
//       $( ":text" ).val(""); //clears text inputs for next question
//     }, 
//     error: function() {
//       window.alert("Oops, there was a problem adding your question.");
//     }
//   });
// })

// $( ".add-question-button").click(newChoice);

// ----------Radio-Button-Listeners---------
  // hides show multi-c and short-a fields
$('#mult-choice-radio').click(function() {
   if($('#mult-choice-radio').is(':checked')) { 
    console.log("mc's checked"); 
    $( ".mult-choice-answer-panel" ).removeClass( "hidden" );
    // $( ".mult-choice-answer-panel" ).prop('disabled', false);
    $( ".short-answer-panel" ).addClass( "hidden" );
    // $( ".short-answer-panel" ).prop('disabled', true);
    // $( ".mult-choice-answer-panel" ).attr('name', myName); // changes/adds name
    // elem.removeAttr('name'); 
  };
});

$('#short-answer-radio').click(function() {
   if($('#short-answer-radio').is(':checked')) { 
    console.log("sa's checked"); 
    $( ".short-answer-panel" ).removeClass( "hidden" );
    // $( ".short-answer-panel" ).prop('disabled', false);
    $( ".mult-choice-answer-panel" ).addClass( "hidden" );
    // $( ".mult-choice-answer-panel" ).prop('disabled', true);
  };
});


