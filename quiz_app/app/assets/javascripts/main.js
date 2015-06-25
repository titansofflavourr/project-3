console.log("main js is linked up");

// ==========QUIZ-CREATION/EDIT=============

// ----------Radio-Button-Listeners---------
  // hides show multi-c and short-a fields
$('#mult-choice-radio').click(function() {
   if($('#mult-choice-radio').is(':checked')) { 
    console.log("mc's checked"); 
    $( ".mult-choice-answer-panel" ).removeClass( "hidden" );
    $( ".short-answer-panel" ).addClass( "hidden" );
  }
});
$('#short-answer-radio').click(function() {
   if($('#short-answer-radio').is(':checked')) { 
    console.log("sa's checked"); 
    $( ".short-answer-panel" ).removeClass( "hidden" );
    $( ".mult-choice-answer-panel" ).addClass( "hidden" );
  }
});

// ------Question-Submit(to-db-and-DOM)-----
$( ".add-question-button").click(function(event){
  event.preventDefault();
  var parameters = $('.new-question-form').serializeArray();
  console.log("parameters=", parameters)

$.ajax({
    url: '/questions',
    type: 'POST',
    data: parameters,
    dataType: 'json'
  }).done(function(result) {
    console.log("ajax is done, now ajaxing ",result["prompt"], " question.");
    // var template = $("#new-card-template").html();
    // var html = Mustache.render(template, result);
    // var number = result["parent_list_id"]
    // var query = "div[id=\'"+number+"\']"
    // $( query ).append(html); //appends new card to list
    // $(query).offsetParent().find("input").val('') //clears input field for new input
  })
});


// element.classList.toggle(“hidden”) 