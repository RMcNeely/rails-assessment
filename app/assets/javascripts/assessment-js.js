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
  var getNewAssessment = $.get("/assessment-"+ newAssessment(e)  + ".json", {'data-id': $(e.target).attr('data-id'), 'format': 'json'}).done( function(data){
    var datum = data[0]
      $('h1#assessment_name').html(datum.name)
      $('h4 a#assessment_by').text(datum.user.name)
      $('h4 a#assessment_by').attr("href", '/users/' + datum.user.id  )
      $('p a#repo_link').attr("href", datum.link)
      $('button.load-assessment').attr('data-id', datum.id)
      $('#assessment_skills_array span').text(JSON.stringify(datum.skills))
      var changeList = $('ul#assessment_skills_array').html(datum.skills)
      // debugger
      datum.skills.forEach(function(skill){
      $('ul#assessment_skills_array').append('<li>'+ skill.name + '</li>')
    });
  });
  // getNext.done(function(data0
  // });
  getNewAssessment.error(function(){
    alert("Woops! Something went wrong")
  });
});
