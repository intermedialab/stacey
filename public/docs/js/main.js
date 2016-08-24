
  !function ($) {
  	
	  	(function($){
	 
	    $.fn.shuffle = function() {
	 
	        var allElems = this.get(),
	            getRandom = function(max) {
	                return Math.floor(Math.random() * max);
	            },
	            shuffled = $.map(allElems, function(){
	                var random = getRandom(allElems.length),
	                    randEl = $(allElems[random]).clone(true)[0];
	                allElems.splice(random, 1);
	                return randEl;
	           });
	 
	        this.each(function(i){
	            $(this).replaceWith($(shuffled[i]));
	        });
	 
	        return $(shuffled);
	 
	    };
 
	})(jQuery);
    
    $(function(){

   			// BRIGHTNESS FILTER IN SAFARI

			var oldBrightnessModel = $("<div/>").css("-webkit-filter","brightness(120%)").css("-webkit-filter")==""?true:false;
			var browserVersion = jQuery.browser.version.substring(0,jQuery.browser.version.indexOf('.'));
			if ( oldBrightnessModel ) {
				$('.img-gray-hover').removeClass('img-gray-hover').addClass('img-gray-hover-old');	
				$('img.gray-hover').removeClass('gray-hover').addClass('gray-hover-old');	
				$('.img-gray').removeClass('img-gray').addClass('img-gray-old');	
				$('img.gray').removeClass('gray').addClass('gray-old');	
			} else {
				$('.img-gray-hover').removeClass('img-gray-hover').addClass('img-gray-hover-new');	
				$('img.gray-hover').removeClass('gray-hover').addClass('gray-hover-new');	
				$('.img-gray').removeClass('img-gray').addClass('img-gray-new');	
				$('img.gray').removeClass('gray').addClass('gray-new');	
			}

		// CAROUSEL

		$('.carousel').carousel({
		  interval: 7000,
		  pause:''
		});
		
		centerImage();

		function removeLoader() {
			$('.carousel-loader').remove();
		}
		
		function shuffleElements(){
			$('.carousel-shuffle .item:not(.active)').shuffle();
			$('.carousel-shuffle').removeClass('carousel-shuffle');
		}

		function centerImage() {
			var imageWidth, imageHeight, wrapperWidth, wrapperHeight, overlap;
			var container = $('.carousel .item');
			wrapperHeight = $('.carousel').height();
		        wrapperWidth = $('.carousel').width();
			$( '.carousel .item img' ).each(function( index, elem ) {
				// this: the current, raw DOM element
				// index: the current element's index in the selection
				// elem: the current, raw DOM element (same as this)
				imageHeight = $( elem ).height();
				imageWidth = $( elem ).width();
				if(imageHeight == 0){
					$( elem ).parent().addClass('measuring');
					imageHeight = $( elem ).height();
					imageWidth = $( elem ).width();
					$( elem ).parent().removeClass('measuring');
				}
				var imageAspect = imageHeight / imageWidth;
				var wrapperAspect = wrapperHeight / wrapperWidth;
				if (imageAspect > wrapperAspect){
                                            $( elem ).removeClass('horisontal-center');
                                            $( elem ).addClass('vertical-center');
            	                        imageHeight = $( elem ).height();
    	                                imageWidth = $( elem ).width();
                                        if(imageHeight == 0){
                            	                $( elem ).parent().addClass('measuring');
                    	                        imageHeight = $( elem ).height();
            	                                imageWidth = $( elem ).width();
    	                                        $( elem ).parent().removeClass('measuring');
                                        }
					overlap = (wrapperHeight - imageHeight) / 2;
					$( elem ).css('margin-top', overlap);
					$( elem ).css('margin-left','');
				} else {
                                            $( elem ).removeClass('vertical-center');
                                            $( elem ).addClass('horisontal-center');
					overlap = (wrapperWidth - imageWidth) / 2;
					imageHeight = $( elem ).height();
                                            imageWidth = $( elem ).width();
                                            if(imageHeight == 0){
                                                    $( elem ).parent().addClass('measuring');
                                                    imageHeight = $( elem ).height();
                                                    imageWidth = $( elem ).width();
                                                    $( elem ).parent().removeClass('measuring');
                                            }
					$( elem ).css('margin-top', '');
                                        $( elem ).css('margin-left', overlap);
				}
			});
		}
		
		$(document).ready(function() {
			
			$(window).on("load resize", centerImage);
			
			$(window).on("load", shuffleElements);
			
			
			$('.carousel').on("slid", centerImage);
			$('.carousel').on("slid", removeLoader);
			
			centerImage();

			// TAG TOOLTIPS
			
			$("a.tag[rel=tooltip]")
	      	.tooltip({
	      		delay: { show: 100, hide: 500 }
	      	})
	      	.click(function(e) {
	      		if($(this).hasClass('in')){
	      			$(this).removeClass('in');
	      		} else {
		      		$("a.tag[rel=tooltip].in").removeClass('in').tooltip('hide');
		      		$( this ).addClass('in');
	      		}
	      		//this.popover('show');
	      		e.preventDefault()
	      	})
	      	.mouseenter(function(){
	      		var tag = $(this).data('tag');
	      		$("a.tag[data-tag='"+ tag +"']").fadeTo('fast',1.0);
	      	})
	      	.mouseleave(function(){
	      		var tag = $(this).data('tag');
	      		$("a.tag[data-tag='"+ tag +"']").fadeTo('slow',0.4);
	      	});
		
			// VIDEO resizing
			
			    var $allVideos = $("iframe[src*='//player.vimeo.com'], iframe[src*='//www.youtube.com'], iframe[src*='//itu.23video.com'], iframe.video, object, embed");
				    	
				$allVideos.each(function() {
				
				  $(this)
				    // jQuery .data does not work on object/embed elements
				    .attr('data-aspectRatio', this.height / this.width)
				    .removeAttr('height')
				    .removeAttr('width');
				
				});
				
				$(window).resize(function() {
				
				  $allVideos.each(function() {
					var newWidth = $(this).parent().width();
				    var $el = $(this);
				    $el
				        .width(newWidth)
				        .height(newWidth * $el.attr('data-aspectRatio'));
				  
				  });
				
				}).resize();
			
			// FULLCALENDAR
			
 		var AEFC = $('#calendar').fullCalendar({
 			header: {
 				left: 'prev,next today',
 				center: 'title',
 				right: 'month,agendaWeek,agendaDay'
 			},
 			//timezone: 'local',
 			editable: false,
 			weekNumbers: true,
 			businessHours: true,
 			views: {
        		week: { // name of view
            		titleFormat: 'MMMM D YYYY',
            		columnFormat: 'ddd D/M',
            		axisFormat: 'HH:mm',
            		// other view-specific options here
        		}
    		},
    		defaultView: 'agendaWeek',
 			firstDay: 1,
 			timeFormat: 'H(:mm)',
 			eventLimit: true, // allow "more" link when too many events
 			eventRender: function(event, el) {
 				// render the timezone offset below the event title
 				if (event.start.hasZone()) {
 					el.find('.fc-title').after(
 						$('<div class="tzo"/>').text(event.start.format('Z'))
 					);
 				}
 			},
 		});
 		
 		                var cal, icalevents, dtstart, dtend, StrStart, StrEnd, StrID, StrAllDay, StrTitle, StrURL, StrLocation, StrDescription;
 		
                        cal = $.parseIcs("/public/calendar/timeEditIcs.php");
                        icalevents = [];

                        for (i = 0; i < cal.event.length; i = i + 1) {
                            dtstart = cal.event[i].dtstart[0].value;
                            StrStart = dtstart.substring(0, 4) + '-' + dtstart.substring(4, 6) + '-' + dtstart.substring(6, 8);
                            if (dtstart.substring(9, 11) !== '') {
                                StrStart = StrStart + 'T' + dtstart.substring(9, 11) + ':' + dtstart.substring(11, 13) + ':' + dtstart.substring(13, 15);
                            }

                            dtend = cal.event[i].dtend[0].value;
                            StrEnd = dtend.substring(0, 4) + '-' + dtend.substring(4, 6) + '-' + dtend.substring(6, 8);
                            if (dtend.substring(9, 11) !== '') {
                                StrEnd = StrEnd + 'T' + dtend.substring(9, 11) + ':' + dtend.substring(11, 13) + ':' + dtend.substring(13, 15); //+'+01:00';
                            }

                            StrAllDay = StrStart.indexOf("T") === -1;
 							
 							if (cal.event[i].uid !== "undefined") { StrID = 'ICS'+AEFC.nbcalendars+'#'+cal.event[i].uid[0].value ;} 
 							if (cal.event[i].summary !== "undefined") {
 								// ITU specific hackery
 								 var res = cal.event[i].summary[0].value.replace(/\\,/gi, "");
 								 res = res.replace("Study Activity", "Course:");
 								 res = res.replace(" : ", "");
 								 res = res.replace(/.*Activity: Meeting/gi, "Meeting:");
 								 StrTitle = res;
 								 } 
 							//if (cal.event[i].url !== "undefined") { StrURL = cal.event[i].url[0].value;} 
 							if (cal.event[i].location!== "undefined") { StrLocation = cal.event[i].location[0].value;} 
 							//if (cal.event[i].description !== "undefined") { StrDescription = cal.event[i].description[0].value;} 
 							
                            icalevents.push({
                                id: StrID,
                                title: StrTitle,
                                url: StrURL,
                                start: StrStart,
                                end: StrEnd,
                                allDay: StrAllDay,
                                location: StrLocation,
                                description: StrDescription,
 								editable:false,
 								//className: val.className,
 								//color: val.color,
 								//textColor: val.textColor
                            });
                        }

                        $('#calendar').fullCalendar( 'addEventSource', {
            				events: icalevents
 						});
 								
		});
	})
		
  }(window.jQuery)
:
