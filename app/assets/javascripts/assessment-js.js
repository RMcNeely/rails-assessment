$('button.load-assessment').on('click', function(e){
  e.preventDefault()
  var e

  var newAssessment = function(e) {
    if($(e.target).attr('data-next') === '+1'){
      return 'next'
    } else {
      return 'prev'
    }
  }
debugger
  var getNewAssessment = $.get("/assessment-"+ newAssessment(e)  + ".json", {'data-id': $(e.target).attr('data-id'), 'format': 'json'}).done( function(data){
    var datum = data
    debugger
      $('h1#assessment_name').html(data.name)
      $('h4 a#assessment_by').text(data.user.name)
      $('h4 a#assessment_by').attr("href", '/users/' + data.user.id  )
      $('p a#repo_link').attr("href", data.link)
      $('button.buttons').attr('data-id', data.id)
      $('#assessment_skills_array span').text(JSON.stringify(data.skills))
      var changeList = $('ul#assessment_skills_array').html(data.skills)
      // debugger
      data.skills.forEach(function(skill){
      $('ul#assessment_skills_array').append('<li>'+ skill.name + '</li>')
    });
  });
  // getNext.done(function(data0
  // });
  getNewAssessment.error(function(){
    alert("Woops! Something went wrong")
  });
});
// $('button.load_assessment').on('click', function(e){
//   e.preventDefault()
//   var assessment = parseInt($(this).attr('data-id')) - 1
//   // debugger
//   var getNext = $.get("/assessment/"+ assessment  + ".json", function(data){
//       $('div.change_assessment_to_render p').text(JSON.stringify(data))
//       $('h1#assessment_name').html(data.name)
//       $('h4 a#assessment_by').text(data.user.name)
//       $('h4 a#assessment_by').attr("href", '/users/' + data.user.id  )
//       $('p a#repo_link').attr("href", data.link)
//       $('button.buttons').attr('data-id', data.id)
//       $('#assessment_skills_array span').text(JSON.stringify(data.skills))
//       var changeList = $('ul#assessment_skills_array').html(data.skills)
//       // debugger
//       data.skills.forEach(function(skill){
//       $('ul#assessment_skills_array').append('<li>'+ skill.name + '</li>')
//     });
//   });
//   getNext.error(function(){
//     alert("Woah there looks like you're at the first one already!")
//   });
// });
