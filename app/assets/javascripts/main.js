$(document).ready(function() {

  // Display home page with creatures image
  $('a#home-link').click(function(e) {
    e.preventDefault();
    var content = $('#content')
    content.html('')
    content.html('<h1>Welcome to Creature Central</h1><div class="container-fluid"><img src="/assets/creatures-3c0b0b2aebee641649c842c14cca13271a0f061da19dde7390bc2081ead71866.jpg" id="home-image"></div>')
  })

  // Show list of all creatures
  $('#all-creatures').click(function(e) {
    e.preventDefault();
    var content = $('#content')
    content.html('')
    getCreatures(content);
  })

  // Delete creature from database and remove from list of all creatures
  $('#content').on('click','button.delete-btn', function(e) {
    e.preventDefault();
    var btn = $(this);

    $.ajax({
      url: btn.attr('action'),
      method: 'DELETE',
      success: function(data) {
        btn.closest('.well').remove();
      },
      error: function(err) {
        console.log(err);
      }
    })
  })

  // Load form for creating new creature
  $('body').on('click', '.new-btn', function(e) {
    e.preventDefault();
    var content = $('#content');
    content.html('')
    content.html(
      '<div class="container-fluid"><h1>Create New Creatures</h1><form id="creature-form" action="/creatures" method="POST" role="form"><div class="form-group"><label for="new-name"> Name </label><input type="text" name="name" class="form-control new-field" id="new-name" placeholder="Enter a new creature name"><label for="new-desc"> Description </label><input type="text" class="form-control new-field" id="new-desc" name="desc" placeholder="Enter a new creature description"></div><button type="submit" class="btn btn-primary create-btn"> Create Creature </button></form>'
      );
  })

  $(document).on('submit', 'form#creature-form', function(e) {
    e.preventDefault();
    var content = $('#content');
    content.html('');
    var form = $(e.target);
    $.ajax({
      url: '/creatures',
      method: 'POST',
      data: { creature: { name: form[0][0].value, description: form[0][1].value } },
      success: function(creature) {
        console.log(creature);
        getCreatures(content);
      },
      error: function(err) {
        console.log(err);
      }
    })

  });


})

var getCreatures = function(content) {
  $.ajax({
      url: '/creatures',
      method: 'GET',
      success: function(creatures) {
        console.log(creatures);
        content.append(
          '<div class="container-fluid"><h1>All Creatures</h1> <button class="btn btn-primary new-btn" method="GET" action="/creatures/new"> New Creature </button></div><div id="creature-list" class="container-fluid"></div>'
          );
        creatures.forEach(function(creature) {
          $('#creature-list').append(
            '<div class="well"><p><span style="font-weight: bold"><a href="/creatures/' + creature.id + '"> ' + creature.name + '</a></span> ' + creature.description + '</p><button method="DELETE" action="/creatures/' + creature.id + '" class="btn btn-danger delete-btn"> Delete </button>'
            )
        });
        window.location = 'localhost:3000/creatures'
      },
      error: function(err) {

      }
    })
}