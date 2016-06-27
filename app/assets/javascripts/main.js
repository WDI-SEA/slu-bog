$(document).ready(function(){
$('#creature-form').hide();

  $('#all-creatures').click(function(e){
    e.preventDefault();
    $('#home-section').hide();
     $('#creature-form').hide();
    $('#creature-section').show();
    $.ajax({
      url: '/api/creatures/all',
      method: 'GET',
      success: function(data){
        console.log(data);
        var contentSelection = $('#creature-section')
        contentSelection.html('');
        data.forEach(function(creature){
          contentSelection.append('<a href="/api/creature/' + creature.id + '" class="show-link"><h2>' + creature.name + '</h2></a>')
          creature.tags.forEach(function(tag){
            console.log(tag);
            contentSelection.append('<p>' + tag.name+ '</p>');
          })
        })
      }, 
      error: function(err){
        console.log(err);
      }
    })
  })

$('#creature-section').on('click','a.show-link', function(e){
    e.preventDefault();

    var aTag = $(this);
    $.ajax({
      url: aTag.attr('href'),
      method: 'GET',
      success: function(creature){
        console.log(creature);
        $('#creature-section').html('<h2>' + creature.name + '</h2><p>' + creature.description +'</p>')
      },
      error: function(err){
        console.log(err);
      }
    })
  });

$('#report-creatures').click(function(e){
  e.preventDefault();
  $('#creature-form').show();
   $('#creature-section').hide();
})


  $('.new-form').submit(function(e){
    e.preventDefault();
    var creatureName = $('#name').val();
    var description = $('#description').val();

    // var data = $('.new-form').serializeArray();
    $.ajax({
      url: 'api/creatures/create',
      method: 'POST',
      authenticity_token: window._token,
      data: {creature: {name: creatureName, description: description}},
      // data: {creature: {data}},
      success: function(){
        console.log("your new creature has been saved");
      },
      error: function(err){
        console.log("ERROR", err);

      }
    })
  })










$('#home-btn').click(function(e){
  e.preventDefault();
  $('#home-section').show();
  $('#creature-section').hide();
  $('#creature-form').hide();
})












});