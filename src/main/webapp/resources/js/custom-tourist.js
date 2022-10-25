/**
 * 
 */

function getTourist(){
	$.ajax({
		url: './tourist',
		type: 'post',
		async: false,
		data: {
			x:x,
			y:y
		},
		dataType: "HTML",
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data){
			$("#tour").html(data);
			 $('.card-carousel').owlCarousel({
		            loop: false,
		            items: 3,
		            nav: false,
		            dots: true,
		            smartSpeed: 700,
		            autoplay: false,
		            center: false,
		            margin: 30,
		            responsive : {
		                // breakpoint from 0 up
		                0 : {
		                    items: 1
		                },
		                // breakpoint from 480 up
		                480 : {
		                    items: 1
		                },
		                // breakpoint from 600 up
		                600 : {
		                    items: 2
		                },
		                // breakpoint from 992 up
		                992 : {
		                    items: 3
		                }
		            }
		        });
		},
		error: function(data){
			alert("error");
		}
	});
}

