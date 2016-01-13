$(document).ready(function() {
	console.log("CHECK");
	$('.js-delete-btn').on('click', function(e) {
		e.preventDefault();
		var btn = $(this);
		var requestType = btn.data('request-type');
		$.ajax({
			url: btn.attr('href'),
			method: 'DELETE',
			dataType: 'json',
		}).done(function(data) {
			console.log("CLICK");
			if(requestType === 'html') {
				window.location = '/';
			} else if (data) {
				btn.closest('#deleteMe').remove();
			}
		});
	});
});
