$(function() {
 
	$('#Calendar').fullCalendar({
		header: 
		{
				left:'month,agendaWeek,agendaDay',
			    center: 'title',
			    right:  'today prev,next'
		},
		
		firstDay: 1,
		defaultView: 'agendaWeek',
		
    	events: function(start, end, callback) {
        	$.ajax({
				type: 'GET',
            	url: '/dockets/get_dockets',
            	dataType: 'json',
            	data: {
	                start: Math.round(start.getTime() / 1000),
	                end: Math.round(end.getTime() / 1000)
	            },
	            success: function(dockets) {
	                var events = [];
						for ( var i = 0; i < dockets.length; i++  ) {
							var docket = dockets[i];
	                    	events.push(docket);
						}
          
	                callback(events);
	            }
	        });
	    }
	});

});
