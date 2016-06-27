$(document).ready(function(){

$('#newForm').hide();

$('#all-creatures').click(function(e){
    e.preventDefault();
    $.ajax({
      url: '/api/creatures/all',
      method: 'GET',
      success: function(data){
        var contentSection = $('#content-section')
        contentSection.html('');
        data.forEach(function(creature){
          contentSection.append(
            '<a href="/api/creatures/' + creature.id + '"class="show-link"><h2>' + creature.username + '</</a><p>' + creature.creature + '</p>'
          );
        });
      },
      error: function(err){
        console.log(err);
      }
    });
  });

$('#content-section').on('click', 'a.show-link', function(e) {
    e.preventDefault();
    var aTag = $(this);

    $.ajax({
      url: aTag.attr('href'),
      method: 'GET',
      success: function(creature){
        $('#content-section').html('<h2>' +creature.username+ '</h2><p>'+creature.creature + '</p>')
      },
      error: function(err){
        console.log(err);
      }
    })
  })

  // Create New
 $('#createNew').on('click',function(e){
    e.preventDefault();
    $('#newForm').show();
 })

 $('#newForm').on('submit', function(e) {
    e.preventDefault();
    alert('yo')
    var data = $(this).serialize();
    $.ajax({
      type: 'POST',
      url: $(this).attr('action'),
      data: data,
      success: function(creature) {
        alert("data posted");
      },
      error: function(err){
        console.log(err);
      }
    })
 })







})
