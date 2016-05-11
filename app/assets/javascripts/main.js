$(document).ready(function() {

	$('button#home').click(function(e) {
		e.preventDefault();

		$.ajax({
			url: '/creatures/index',
			method: 'GET',
			success: function(data) {
				var contentSection = $('#content-section')
					// contentSection.html('');

					data.forEach(function(creature) {
						console.log("<h2>"+ creature.name + "</h2><p>"+ creature.description "</p>");
					});
			},
			error: function(err) {
				console.log(err);
			}
		});
	});

	$('#content-section').on('click', 'li.tagpath', function(e) {
		e.preventDefault();

		var liTag = $(this);

		$.ajax({
			url: liTag.attr('href'),
			method: 'GET',
			success: function(data) {
				var contentSection = $('#content-section')
					contentSection.html('');
				// console.log(data.name);
				$('#content-section').html('<h1>Creatures with <%= @tag.name %>Tag</h1><% for creature in @creatures %><li> <%= link_to creature.name, creature_path(creature) %></li><% end %>');
			},
			error: function(err) {
				console.log(err);
			}
		})
	});
});