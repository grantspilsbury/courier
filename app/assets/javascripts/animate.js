jQuery(document).ready(function($) {

							
	//animate effect	
	$(".e_pulse").hover(
		function () {
		$(this).addClass("animated pulse");
		},
		function () {
		$(this).removeClass("animated pulse");
		}
	);

});