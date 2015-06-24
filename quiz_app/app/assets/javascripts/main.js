console.log("main js is linked up");

// var rcmc = document.querySelector("#mult-choice-radio");

// rcmc.addEventListener("click", function(event) {
//     window.alert('clicked');




// });


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


// element.classList.toggle(“hidden”) 