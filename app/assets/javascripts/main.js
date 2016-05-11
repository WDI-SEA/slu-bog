$(document).ready(function() {
	
	function buttonListeners() {
	$('button.to-all-creatures').click(function(e) {
		e.preventDefault();

		$.ajax({ 
			url: '/creatures',
			method: 'GET',
			success: function(data) {
				var homepage = $('#homepage');
				homepage.html('');

				data.forEach(function(creatures) {
					homepage.append(
						'<a href="/creatures/' + creatures.id + '" class="show-link"><h1>' + creatures.name + '</h1></a>'
					);
				});
				addEventListeners();
			},
			error: function(err) {
				console.log(err);
			}
		});
	});
}

	function editCreature() {
		$('.edit-button').on('click', function(e) {
			e.preventDefault();
			console.log(this.href);
			$.ajax({
				url: this.href,
				method: 'GET',
				success: function(creature) {
					var homepage = $('#homepage');
					homepage.html('');

					homepage.append(
						'<h1>' + creature.name + '</h1>'
						);
					homepage.append(
						'<form>' +
						'Name <input type="text" name="name" placeholder=' + creature.name +'>' + 
						'Description <input type="text_area" name="description" placeholder=' + creature.description + '>' + 
						'<input type="submit">Submit' +
						'</form>'
						);
				},
				error: function(err) {
					console.log(err);
				}
			});
		});
	}

	function deleteCreature() {
		$('.delete-creature').on('click', function(e) {
			e.preventDefault();

			$.ajax({
				url: this.href,
				method: 'DELETE',
				success: function(data) {
					homepage = $('#homepage');

					homepage.append(
						'<form action="#" method ="POST">' +
						'<input type="hidden" name="name">' + 
						'<input type="hidden" name="description">' + 
						'<input type="hidden" name="id">'
						'<input type="submit">' +
						'</form>'
						);
				}
			})
		})
	}

	function addEventListeners() {
		$('.show-link').click(function(e) {
		e.preventDefault();
		console.log(this.href);
		$.ajax({ 
			url: this.href,
			method: 'GET',
			success: function(creature) {
				var homepage = $('#homepage');
				homepage.html('');

					
					homepage.append(
						'<h1>' + creature.name + '</h1><br><h3>' + creature.description + 
						'</h3><br><a href="/creatures/' + creature.id + 
						'/edit" class="edit-button"><button class="btn-primary">Edit</button></a>'+
						'<a href="/creatures/' + creature.id + '"><button class="btn-primary delete-creature">' +
						'Delete</button></a>' +
						'<a href="/creatures"><button class="btn-primary to-all-creatures">Go Back</button></a>'
					);
				buttonListeners();	
				editCreature();
			},
			error: function(err) {
				console.log(err);
			}
		});
	});
	}






	buttonListeners();
	editCreature();
});