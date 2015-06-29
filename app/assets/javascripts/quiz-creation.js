console.log("quiz_creation js is linked up");

// ==========QUIZ-CREATION/EDIT=============

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
  }
});
$('#short-answer-radio').click(function() {
   if($('#short-answer-radio').is(':checked')) { 
    console.log("sa's checked"); 
    $( ".short-answer-panel" ).removeClass( "hidden" );
    // $( ".short-answer-panel" ).prop('disabled', false);
    $( ".mult-choice-answer-panel" ).addClass( "hidden" );
    // $( ".mult-choice-answer-panel" ).prop('disabled', true);
  }
});

// ------Question-Submit(to-db-and-DOM)-----
var myFunc = function(event){
  event.preventDefault();
  var parameters = $('.new-question-form').serializeArray();
            // ------db-----
  console.log('executing ajx query now');
  console.log(parameters);
  $.ajax({
    url: '/addquestion',
    type: 'POST',
    data: parameters,
    dataType: 'json'
  }).done(function(result) {
    var template = $("#new-question-template").html();
    var html = Mustache.render(template, result);
    $( "#quiz-questions" ).append(html); //appends     
    $( ":text" ).val(""); //clears text inputs for next question
  })
}

$( ".add-question-button").click(myFunc)


