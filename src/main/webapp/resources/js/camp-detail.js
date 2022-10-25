/**
 * 
 */

$("#loadMore").click(function(){
	  let pageCount = document.getElementById("pageCount").value;
	  let nextPage = document.getElementById("nextPage").value;
	  let campIdx = document.getElementById("campIdx").value;
	 //console.log("nextPage : "+nextPage+", pageCount : "+pageCount );
	 if(nextPage > pageCount) {
         $('#loadMore').attr("disabled", "disabled");
         $('#loadMore').text("END");
         return false;
     }
  $.ajax({
      url:"./loadMore.bam",
      type:"POST",
      data: {
    	  camp_idx : campIdx,
    	  nextPage : nextPage
      },
      dataType: "HTML",
      contentType: 'application/x-www-form-urlencoded; charset=utf-8',
      success: function(result) {
    	  	document.getElementById("nextPage").value = Number(nextPage)+1;
          if (result) {
        	  $(".reviewList").append(result);
          }
      }
   });
});

function setSessionAndSubmit(){
	
	const email = document.getElementById("initMember").value;

	if(email===""){
		alert("로그인이 필요합니다.");
		location.href="../login/login.bam";
		return false;
	}
	
	var checkbbq = document.getElementsByClassName("check-bbq");
	var isBbqChecked = $(checkbbq).is(":checked");
	var bbqPrice = 0;
		
	if(isBbqChecked){
		bbqPrice = bbq_fee.format();
	} else {
		bbqPrice = 0;
	}
	var bookingInfo = {
			campIdx : document.getElementById('campIdx').value,
			campName : campName,
			address : document.getElementById("address").value,
			campZone : campZone,
			peopleNum : document.getElementById('peopleNum').value, 
			category : category,
			campPrice : campPrice,
			bbqPrice : bbqPrice,
			checkDate : document.getElementById('checkDate').value,
			sort_idx : sort_idx
	};
	console.log("bookingInfo.sort_idx : "+bookingInfo.bbqPrice);
	sessionStorage.setItem("bookingInfo", JSON.stringify(bookingInfo)); //세션저장 -> booking.jsp
	
	var sessionItem = JSON.parse(sessionStorage.getItem("bookingInfo"));
	
	location.href = "../booking/booking.bam";
}



window.onload = function setCalender(){
	var now = new Date();
	var currentDate = now.getDate()+'/'+(now.getMonth()+1)+'/'+now.getFullYear();
	document.getElementsByClassName("calender-customize").value = currentDate;
	
	


	
	$(".price").text(function() {//1000단위 컴마처리
	    $(this).text(
	        $(this).text().format()
	    );
	});

	//예약버튼 비활성화
	document.getElementById('booking-event').style.pointerEvents = 'none';
	$('#booking-event').css({cursor: 'pointer'});
}
