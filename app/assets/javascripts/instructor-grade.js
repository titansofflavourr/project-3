console.log("instructor-grade linked")

$('.instructor-grade-submit-button').on('click', function() {
  console.log($(this).parent().find('.response-grade').val())
  var grade = $(this).parent().find('.response-grade')
  var id = $(this).parent().find('.response-grade').attr('id')
  update_response_grade(id, grade.val());
  $(this).addClass("hidden");
  $(this).next().removeClass("hidden");
  grade.attr("disabled", true);
});


var update_response_grade = function (response_id, grade) {
   var url = "/responses/" + response_id;
  // debugger;
  $.ajax({
    url: url,
    type: "PATCH",
    data: {
      id: response_id,
      grade: grade
    }
  }).done(function(response) {
    console.log("ajax done",response);
    // debugger;
  })
}

$('.instructor-grade-edit-button').on('click',function() {
  console.log("edit butt clicked")
  $(this).parent().find('.response-grade').attr("disabled",false);
  $(this).addClass("hidden");
  $(this).prev().removeClass("hidden");
})


$('#save-total-grade').on('click', function(){
  var quizid = $('#user-header').children().attr('id')
  var assid = $('.student-quiz-cohort-name').attr('id')
  var url = "/quizzes/"+ quizid +"/assessments/"+ assid
  var user_id = $('#user-header').attr('class')
  $.ajax({
    url: url,
    type: "PATCH",
    data: {
      user_id: user_id
    }
  }).done(function(result){
    console.log("ajax post done")
    debugger;
    $("#confirmation").html(" Submitted Grade of " + result)
  })
})