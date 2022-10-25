/**
 * 
 */
 
 
 // 회원 정보 수정
 
 function getUploadTags(){
	
	$('#user-name').removeAttr('readonly');
	
	input_html = "";
        input_html += "<div class='input-box'>"
            + "<label class='label-text'>닉네임 </label>"
            + "<div class='form-group'>"
            + "<input type='text' name='nickname' value='"+document.getElementById('nick').value+"' class='form-control'>"
            + "</div>"                               
        	+ "</div>";
	 $('.update').val("저장");
	
	 $('.update').attr('onclick', 'update_mem();');
     $('#test').html(input_html);
     
 }
 
function update_mem(){
	$('.update').attr('type', 'submit');
	alert("수정 완료");

}

// 사업자 정보 띄우기
function owner_info(){
	$.ajax({
		url: "../owner/owner_detail.bam",
		method: "GET",
		//data: {},
		dataType: "HTML",
		success: function(responseData){
			console.log("ajax communication - success");
			$('#owner-info').html(responseData);
			//let test = $('#nav-camping').html(responseData);
			//test.trigger('create');

			owlCarousel();
		}
	});
}

// 올빼미 회전목마(owl-carousel) 기능 재정의 함수
function owlCarousel(){
	$('.gallery-carousel').owlCarousel({
		loop: true,
		items: 1,
		nav: true,
		dots: true,
		smartSpeed: 700,
		autoplay: false,
		dotsData: true,
		navText: ["<span class=\"la la-chevron-left\"></span>", "<span class=\"la la-chevron-right\"></span>"]
	});
}