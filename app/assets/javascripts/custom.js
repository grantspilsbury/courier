/*global jQuery:false */
jQuery(document).ready(function($) {
"use strict";


	(function() {

		var $menu = $('.navigation nav'),
			optionsList = '<option value="" selected>Go to..</option>';

		$menu.find('li').each(function() {
			var $this   = $(this),
				$anchor = $this.children('a'),
				depth   = $this.parents('ul').length - 1,
				indent  = '';

			if( depth ) {
				while( depth > 0 ) {
					indent += ' - ';
					depth--;
				}

			}
			$(".nav li").parent().addClass("bold");

			optionsList += '<option value="' + $anchor.attr('href') + '">' + indent + ' ' + $anchor.text() + '</option>';
		}).end()
		.after('<select class="selectmenu">' + optionsList + '</select>');
		
		$('select.selectmenu').on('change', function() {
			window.location = $(this).val();
		});
		
	})();

	
		  $('.toggle-link').each(function() {
			$(this).click(function() {
			  var state = 'open'; //assume target is closed & needs opening
			  var target = $(this).attr('data-target');
			  var targetState = $(this).attr('data-target-state');
			  
			  //allows trigger link to say target is open & should be closed
			  if (typeof targetState !== 'undefined' && targetState !== false) {
				state = targetState;
			  }
			  
			  if (state == 'undefined') {
				state = 'open';
			  }
			  
			  $(target).toggleClass('toggle-link-'+ state);
			  $(this).toggleClass(state);      
			});
		  });
	
		//add some elements with animate effect

		$(".box").hover(
			function () {
			$(this).find('.icon').addClass("animated pulse");
			},
			function () {
			$(this).find('.icon').removeClass("animated pulse");
			}
		);
		
		
		$('.accordion').on('show', function (e) {
		
			$(e.target).prev('.accordion-heading').find('.accordion-toggle').addClass('active');
			$(e.target).prev('.accordion-heading').find('.accordion-toggle i').removeClass('icon-plus');
			$(e.target).prev('.accordion-heading').find('.accordion-toggle i').addClass('icon-minus');
		});
		
		$('.accordion').on('hide', function (e) {
			$(this).find('.accordion-toggle').not($(e.target)).removeClass('active');
			$(this).find('.accordion-toggle i').not($(e.target)).removeClass('icon-minus');
			$(this).find('.accordion-toggle i').not($(e.target)).addClass('icon-plus');
		});	


		
		//Navi hover
		$('ul.nav li.dropdown').hover(function () {
			$(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn();
		}, function () {
			$(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut();
		});
		
		// tooltip
		$('.social-network li a, .options_box .color a').tooltip();

		
		//scroll to top
		$(window).scroll(function(){
			if ($(this).scrollTop() > 100) {
				$('.scrollup').fadeIn();
				} else {
				$('.scrollup').fadeOut();
			}
		});
		$('.scrollup').click(function(){
			$("html, body").animate({ scrollTop: 0 }, 1000);
				return false;
		});
		
	
		//TWITTER
		getTwitters('twitter', {
			id: 'wrapbootstrap',
			count: 1,
			enableLinks: true,
			ignoreReplies: false,
			template: '<i class="icon-twitter icon-circled icon-48 active"></i><br /><span class="twitterPrefix"><span class="twitterStatus">%text%</span><br /><em class="twitterTime"><a href="http://twitter.com/%user_screen_name%/statuses/%id_str%">Date - %time%</a></em>',
			newwindow: true
		});
				
});