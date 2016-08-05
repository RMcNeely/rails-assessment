comment_array = ["<div class='container'>","<div class='comment_txt'>","<span id='comment_txt'></span>","<br>","<span class='comment_by'>","By: someone","</span>","</div>","<br>","</div>"," <br>","<br>","</div>"].join('')
// debugger
$('button.load-assessment').on('click', function(e){
  e.preventDefault()
  var e



  var getNewAssessment = $.get("/assessment/get-new-assessment.json", {'data-id': $(e.target).attr('data-id'), 'data-next': $(e.target).attr('data-next'), 'data-prev': $(e.target).attr('data-prev'),'format': 'json'}).done( function(data){   //START CHANGING THINGS FOR NEW ASSESSMENT //
    console.log("check 1")
    var datum = data[0]

      $('h1#assessment_name').html(datum.name) // CHANGE ASSESSMENT HEADER  //
      $('h4 a#assessment_by').text(datum.user.name) // CHANGE ASSESSMENT USER //
      $('h4 a#assessment_by').attr("href", '/users/' + datum.user.id  ) // CHANGE ASSESSMENT REPO LINK TEXT //
      $('p a#repo_link').attr("href", datum.link) // CHANGE ASSESSMENT REPO LINK //
      $('button.load-assessment').attr('data-id', datum.id) // CHANGE DATA-ID VALUE //
      // $('#assessment_skills_array span').text(JSON.stringify(datum.skills)) //CHANGE ASSESSMENT SKILLS TEXT //
      var changeList = $('ul#assessment_skills_array').html(datum.skills)
      datum.skills.forEach(function(skill){       //CHANGE ASSESSMENT SKILLS LIST START //
      $('ul#assessment_skills_array').append('<li>'+ skill.name + '</li>')
  });                                           //CHANGE ASSESSMENT SKILLS LIST END //
      $('ul.collaborators').empty()  // EMPTY COLLABORATORS LIST FOR NEW //
        if(datum.assessment_contributers.length){   // START CHANGE COLLABORATORS LIST //
          datum.assessment_contributers.forEach(function(datum){
            // debugger
            $('ul.collaborators').append('<li>'+ datum.contributer_name + '</li>')
          })
        } else {
          $('ul.collaborators').append('<li>none</li>')
        }                       // END CHANGE COLLABORATORS LIST //
      if (datum.comments.length > 0) {   // START CHANGE COMMENTS LIST //
          $('p.empty_comments').remove()

          datum.comments.forEach(function(comment, index){
            console.log('check 2')
          })
        } else {
          $('p.empty_comments').remove()
          $('h4.comments_header').after("<p class='empty_comments'>Be the first to comment!</p>")
          console.log('check 3')
        }    // END CHANGE COMMENTS LIST //
        // datum.comments.text
        //
        // datum.comments.by
      })   // END CHANGING THINGS FOR NEW ASSESSMENT

  getNewAssessment.error(function(){
    alert("Woops! Something went wrong")
  }); // END NEW ASSESSMENT ERROR ALERT //
}); // END NEW ASSESSMENT CLICK EVENT //


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
        $('ul.collaborators').append("<li><input type='checkbox' name=assessment_contributers[] value="+ student.id +" data-id="+ student.id +' data-name="' + `${student.name}` +  '">'+ student.name +'</li></input>')

      }) //end forEach function

      debugger
      collaborators.forEach(function(collaborator) {
        allUsers.forEach(function(individual){
          if(individual.id === parseInt(collaborator.id)){
            $('span ul.collaborators li input[data-name=' + individual.id + ']')[0].checked = true
            $('span ul.collaborators li[data-id=' + individual.id + ']')[0].remove()
          }
        })
      })
  })// end $.get call
  $('a.add-collaborators').addClass('hide')
  $(".save-collaborators").removeClass('hide')
}) // end Add Collaborators click event

$("input[type='button'].save-collaborators").on('click', function(e){
  e.preventDefault()
  form = $('form input:checked').serialize()
  assessment_collaborators = $('input:checked').map(function(i, v){
    return  $(v).attr('data-name')
  })
  path = window.location.pathname + '/update'
  $.post(path, form).done(function() {
    $(".save-collaborators").addClass('hide')
    $('a.add-collaborators').removeClass('hide')
    $('ul.collaborators li').remove()
    assessment_collaborators.each(function(index, individual){
      debugger
      $('ul.collaborators').append('<li>' + individual + '</li>')
    })
    alert("Updated successfully!")
  }).error(function(){
    alert("Something's wrong")
  })
})

/////// ADD NEW COMMENT //////
$('input:button').on('click', function(e){
  console.log('maybe?')
  e.stopPropagation()
  debugger
  $('p.empty_comments').remove()

})
