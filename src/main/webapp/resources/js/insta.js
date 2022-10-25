$(document).ready(function(){ 
			   console.log("hello world");
			   
			   $.ajax({
				   url: "insta/getGrid", 
				   type: "GET",
				   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				   success: function(responseData){
					  //var jsObj = JSON.parse(responseData); //jQuery 버젼을 올려서 필요 없음
					  //encodeURIComponent(responseData);
					  //alert(responseData);
                      if(!responseData){
						  return false;
					  }else{
						  for(i=0;i<6;i++){
							 $(".insta"+i).attr('src', responseData.data[i].media_url);
							 $(".instaLink"+i).attr('href', responseData.data[i].permalink);
							 const time = responseData.data[i].timestamp.split("T");
							 $(".instaTime"+i).html(time[0]);
							 $(".instaContent"+i).html(responseData.data[i].caption);

								//alert("good");
						  }
					  }
				   },
				 error: function(request, status, error){
					 alert(request);
					 alert(status);
					 alert(error);
				 }
			   });
			   
			});