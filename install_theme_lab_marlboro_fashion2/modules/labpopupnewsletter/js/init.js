$(document).ready(function () {

	if ($.cookie("labpopupnewsletter") != "true" && $('body').outerWidth() > 767) {

		$.fancybox.open($('.labpopupnewsletter'), {
	        'padding' : 0,
	        'transitionIn'	: 'none',
			'transitionOut'	: 'none',
			'easingIn'      : 'none',
			'easingOut'     : 'none'
	    });

		$(".labpopupnewsletter").closest(".fancybox-overlay").addClass('labpopup');
		$(".fancybox-skin").append("<div class='fancybox-close-overlay'></div>");

		$(".send-reqest").click(function(){
			var email = $("#newsletter-input-popup").val();
			$.ajax({
				type: "POST",
				headers: { "cache-control": "no-cache" },
				async: false,
				url: lab_path,
				data: "name=marek&email="+email,
				success: function(data) {
					if (data)
						$(".send-response").text(data);
				}
			});
		});
                $("#newsletter_popup_dont_show_again").prop("checked") == false;
	}
	$(".fancybox-close-overlay").click(function(e){
		parent.$.fancybox.close();
                if($("#newsletter_popup_dont_show_again").prop("checked") == true)
                    $.cookie("labpopupnewsletter", "true");
	});

});