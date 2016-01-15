$(document).ready(function() {
	console.log("CHECK");
	$('.js-delete-btn').on('click', function(e) {
		e.preventDefault();
		var btn = $(this);
		var url = '/favorites/' + btn.attr('id');
		var requestType = btn.data('request-type');
		$.ajax({
			url: url,
			method: 'DELETE',
			dataType: 'json',
		}).done(function(data) {
			console.log("CLICK");
			if(requestType === 'html') {
				window.location = '/favorites';
			} else if (data) {
				btn.closest('#deleteMe').remove();
				window.location = '/favorites';
			}
		});
	});
});


autoPlayYouTubeModal();

//FUNCTION TO GET AND AUTO PLAY YOUTUBE VIDEO FROM DATATAG
function autoPlayYouTubeModal() {
  var trigger = $("body").find('[data-toggle="modal"]');
  trigger.click(function () {
      var theModal = $(this).data("target"),
          videoSRC = $(this).attr("data-theVideo"),
          videoSRCauto = videoSRC + "?autoplay=1";
      $(theModal + ' iframe').attr('src', videoSRCauto);
      $(theModal + ' button.close').click(function () {
          $(theModal + ' iframe').attr('src', videoSRC);
      });
  });
}

function goBack() {
    window.history.back();
}
