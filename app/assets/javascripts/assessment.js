$('button.load-assessment').on('click', function(e){
  e.preventDefault()
  var e

  var getNewAssessment = $.get("/assessment/get-new-assessment.json", {'data-id': $(e.target).attr('data-id'), 'data-next': $(e.target).attr('data-next'), 'data-prev': $(e.target).attr('data-prev'),'format': 'json'}).done( function(data){
    console.log("check 1")
    var datum = data[0]
    // debugger
    // if($('span ul.collaborators li:last-child a')){
    //   alert("Please finish editing before moving on.")
    // } else {

      $('h1#assessment_name').html(datum.name)
      $('h4 a#assessment_by').text(datum.user.name)
      $('h4 a#assessment_by').attr("href", '/users/' + datum.user.id  )
      $('p a#repo_link').attr("href", datum.link)
      $('button.load-assessment').attr('data-id', datum.id)
      $('#assessment_skills_array span').text(JSON.stringify(datum.skills))
      var changeList = $('ul#assessment_skills_array').html(datum.skills)
      datum.skills.forEach(function(skill){
      $('ul#assessment_skills_array').append('<li>'+ skill.name + '</li>')
      });
    // }
  });
  getNewAssessment.error(function(){
    alert("Woops! Something went wrong")
  });
});

$('a.add-collaborators#on').on('click', function(e) {
  e.preventDefault()
  allUsers = []

  var collaborators = $.map($('span ul.collaborators li'), function(index, collab ) {
    function Collaborator(index){
        this.id = $(index).attr('data-id')
      }
        return new Collaborator(index)
    })

  var getUsers = $.get('/users.json').done(function(data){
    // $('ul.collaborators').empty()
      data.forEach(function(user_data){
        function Student(data){
          this.name = data.name
          this.id = data.id
        }
        var student = new Student(user_data)
        allUsers.push(student)
        $('ul.collaborators').append("<li><input type='checkbox'  data-id="+ student.id +'>'+ student.name +'</li></input>')

      }) //end forEach function

      // debugger
      collaborators.forEach(function(collaborator) {
        allUsers.forEach(function(individual){
          if(individual.id === parseInt(collaborator.id)){
            $('span ul.collaborators li input[data-id=' + individual.id + ']')[0].checked = true
            $('span ul.collaborators li[data-id=' + individual.id + ']')[0].remove()
          }
        })
      })
  })// end $.get call
  $('a.add-collaborators').remove()
  $(".save-collaborators").removeClass('hide')
}) // end Add Collaborators click event

$("input[type='button'].save-collaborators").on('click', function(e){
  assessment_collaborators = $('input:checked').map(function(i){
    return $(this).attr('data-id')
  })
  path = window.location.pathname + '/update'
  debugger
  $.post(path, {'assessment_collaborators': assessment_collaborators}).done(function() {

    console.log("Completed successfully")
  }).error(function(){
    alert("Something's wrong")
  })
})
