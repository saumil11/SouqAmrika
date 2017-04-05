$(document).ready(function(){
	
///// Language Switching (2 languages: English and Chinese). /////

	  // Initially disable language switching button.
	  $('.switch-lang').css({'pointer-events':'none',
	   'cursor':'default'}).attr('disabled','disabled');

	  function langButtonListen() {
	    $('.switch-lang').click(function (event) {
	      event.preventDefault();
	      $('[lang="ar"]').toggle();
	      $('[lang="en"]').toggle();
	      // Switch cookie stored language.
	      if ($.cookie('lang') === 'en') {
	        $.cookie('lang', 'ar', { expires: 7 });
	      } else {
	        $.cookie('lang', 'en', { expires: 7 });
	      }
	    });
	    // Enable lang switching button.
	    $('.switch-lang').css({'pointer-events':'auto',
	     'cursor':'pointer'}).removeAttr('disabled');
	  }

	  // Check if language cookie already exists.
	  if ($.cookie('lang')) {
	    var lang = $.cookie('lang');
	    if (lang === 'en') {
	      $('[lang="ar"]').hide();
	      langButtonListen();
	    } else {
	      $('[lang="en"]').hide();
	      langButtonListen();
	    }
	  } else {
	    // no cookie set, so detect language based on location.
	    if ("geolocation" in navigator) {
	      // geolocation is available
	      navigator.geolocation.getCurrentPosition(function (position) {
	        // accepted geolocation so figure out which country
	        var lat = position.coords.latitude,
	            lng = position.coords.longitude;
	        $.getJSON('http://maps.googleapis.com/maps/api/geocode/json?latlng='+lat+','+lng+'&sensor=true', null, function (response) {
	          var country = response.results[response.results.length-1].formatted_address;
	          if (country ===  'Taiwan' || country === 'China') {
	            $('[lang="en"]').hide();
	            $.cookie('lang', 'ar', { expires: 7 });
	            langButtonListen();
	          } else {
	            $('[lang="ar"]').hide();
	            $.cookie('lang', 'en', { expires: 7 });
	            langButtonListen();
	          }
	        }).fail(function (err) {
	          console.log('error: '+err);
	          $('[lang="ar"]').hide();
	          $.cookie('lang', 'en', { expires: 7 });
	          langButtonListen();
	        });
	      },
	      function (error) {
	        if (error.code == error.PERMISSION_DENIED) {
	          // denied geolocation
	          $('[lang="ar"]').hide();
	          $.cookie('lang', 'en', { expires: 7 });
	          langButtonListen();
	        } else {
	          console.log('Unknown error. Defaulting to English!');
	          $('[lang="ar"]').hide();
	          $.cookie('lang', 'en', { expires: 7 });
	          langButtonListen();
	        }
	      });
	    } else {
	      // geolocation IS NOT available
	      $('[lang="ar"]').hide();
	      $.cookie('lang', 'en', { expires: 7 });
	      langButtonListen();
	    }
	  }
	
});