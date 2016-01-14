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
