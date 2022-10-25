/**
 * 
 */
function submit(){
	document.getElementById("submit-inquiry").submit();
}
function setInputs(){
	document.getElementById("email").value = document.getElementById("text1").value;
	document.getElementById("owner_num").value = document.getElementById("text2").value;
	document.getElementById("com_addr").value = document.getElementById("sample5_address").value;
	document.getElementById("com_name").value = document.getElementById("text4").value;
	document.getElementById("com_tel").value = document.getElementById("text5").value;
	document.getElementById("title").value = document.getElementById("text6").value;
	document.getElementById("content").value = document.getElementById("text7").value;
	
	if(document.getElementById("owner_num").value == "" || document.getElementById("owner_num").value.length != 12){
		input_empty_msg("owner_num");
		 return;
	}
	if(document.getElementById("title").value == ""){
		input_empty_msg("title");
		 return;		
	}
	if(document.getElementById("content").value == ""){
		input_empty_msg("content");
		 return;		
	}
	if(document.getElementById("com_addr").value == ""){
		input_empty_msg("com_addr");
		return;		
	}
	if(document.getElementById("com_name").value == ""){
		input_empty_msg("com_name");
		return;		
	}
	if(document.getElementById("com_tel").value == "" || document.getElementById("com_tel").value.length != 13){
		input_empty_msg("com_tel");
		return;		
	}
	submit();
}

function input_empty_msg(check){
	var msg_html = "";
	if(check == "owner_num"){
		msg_html += "<div class='alert alert-danger' role='alert'>"
			+ "사업자 번호를 입력해주세요.";
	}else if(check == "title"){
		msg_html += "<div class='alert alert-danger' role='alert'>"
			+ "제목을 입력해주세요.";
	}else if(check == "content"){
		msg_html += "<div class='alert alert-danger' role='alert'>"
			+ "내용을 입력해주세요.";		
	}else if(check == "com_addr"){
	msg_html += "<div class='alert alert-danger' role='alert'>"
		+ "회사 주소을 입력해주세요.";		
	}else if(check == "com_name"){
	msg_html += "<div class='alert alert-danger' role='alert'>"
		+ "회사명을 입력해주세요.";		
	}else if(check == "com_tel"){
	msg_html += "<div class='alert alert-danger' role='alert'>"
		+ "회사 연락처를 입력해주세요.";		
	}
	msg_html += "</div>";
	document.getElementById("check-input").innerHTML = msg_html;
	window.location.href="#focus-here";
}

function email_required(){
	var html = "";
	html += "<div class='alert alert-danger' role='alert'>";
	html += "이메일을 정확히 기재해주세요.";
	html += "</div>";
	document.getElementById("check-input").innerHTML = html;
}

function business_num_required(){
	var html = "";
	html += "<div class='alert alert-danger' role='alert'>";
	html += "사업자 번호는 업체등록시 반드시 필요한 검증 절차입니다. 정확히 기재해주세요.";
	html += "</div>";
	document.getElementById("check-input").innerHTML = html;	
}

function content_required(){
	var html = "";
	html += "<div class='alert alert-danger' role='alert'>";
	html += "캠핑장명, 주소, 캠핑장 전화번호, 캠핑 사이트 수, 1일 최대 수용인원수, 주차장 면수, 편의시설, "
		+"안전시설, 기타부대 시설, 이용요금, 관리기관전화번호, 관리기관명은 필히 기재해주세요. "
		+"하나라도 빠지면 등록 해드릴 수 없으니 하나도 빠짐없이 작성해주세요.";
	html += "</div>";
	document.getElementById("check-input").innerHTML = html;
}

function photo_required(){
	var html = "";
	html += "<div class='alert alert-danger' role='alert'>";
	html += "캠핑장 등록시 필요한 이미지 파일을 업로드 해주세요. "
	html += "등록 완료 후 본 사진들은 캠핑장 상세 정보에 저장되기 때문에 "
		+ "사진을 구분 할 수 있도록 사진파일명을 정확히 기재해주세요.";
	html += "</div>";
	document.getElementById("check-photo-input").innerHTML = html;	
}

