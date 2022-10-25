/**
 * 
 */
function dataForm(dateNtime){
	let d = new Date(dateNtime);
	let month = "";
	let date = "";
	if((d.getMonth()+1)<10){
		month += "0" + (d.getMonth()+1);
	} else{
		month += (d.getMonth()+1);
	}
	if(d.getDate() < 10){
		date += "0"  + d.getDate();
	} else{
		date += d.getDate();
	}
	
	let formattedDate = d.getFullYear() + "-" + month + "-" + date;
	let hours = (d.getHours() < 10) ? "0" + d.getHours() : d.getHours();
	let minutes = (d.getMinutes() < 10) ? "0" + d.getMinutes() : d.getMinutes();
	let formattedTime = hours + ":" + minutes;
	
	return formattedDate;
	
}


function showDetail(responseData, currnetPage, isSearched){
	console.log(responseData.email);
	let detail_html = "";
	detail_html += "<div class='card mb-3'>"
		+ "<div class='card-header'>"
		+ "<h3><i class='fas fa-envelope-open-text bigfonts'></i> "+responseData.name+" - 사업자 등록 상세</h3>"
		+ "</div>"
		+ "<div class='card-body'>"
		+ "<div class='form-group row'>"
		+	"<label for='detail-name' class='col-sm-2 col-form-label'>이름 :</label>"
	    + "<div class='col-sm-10'>"
	    + "<input type='text' readonly class='form-control-plaintext' id='detail-name' value='"+responseData.name+"'>"
	    + "</div>"
	    + "</div>"
	    + "<div class='form-group row'>"
	    +	"<label for='detail-name' class='col-sm-2 col-form-label'>닉네임 :</label>"
	    + "<div class='col-sm-10'>"
	    + "<input type='text' readonly class='form-control-plaintext' id='detail-nickname' value='"+responseData.nickname+"'>"
	    + "</div>"
	    + "</div>"
	    + "<div class='form-group row'>"
	    + "<label for='detail-email' class='col-sm-2 col-form-label'>이메일 :</label>"
	    + "<div class='col-sm-10'>"
	    + "<input type='text' readonly class='form-control-plaintext' id='detail-email' value='"+responseData.email+"'>"
	    + "</div>"
	    + "</div>"
	    + "<div class='form-group row'>"
	    + "<label for='detail-title' class='col-sm-2 col-form-label'>제목 :</label>"
	    + "<div class='col-sm-10'>"
	    + "<input type='text' readonly class='form-control-plaintext modify-input' id='detail-title' value='"+responseData.title+"'>"
	    + "</div>"
		+ "</div>"
		+ "<div class='form-group row'>"
		+ "<label for='detail-content' class='col-sm-2 col-form-label'>내용 :</label>"
		+ "<div class='col-sm-10'>"
		+ "<textarea readonly class='form-control-plaintext modify-input' id='detail-content'>"+responseData.content+"</textarea>"
		+ "</div>"
		+ "</div>"
		+ "<div class='form-group row'>"
		+ "<label for='detail-owner-num' class='col-sm-2 col-form-label'>사업자번호 :</label>"
		+ "<div class='col-sm-10'>"
		+ "<input type='text' readonly class='form-control-plaintext modify-input' id='detail-owner-num' value='"+responseData.owner_num+"'>"
		+ "</div>"
		+ "</div>"
    	+ "<div class='form-group row'>"
    	+ "<label for='detail-com-name' class='col-sm-2 col-form-label'>회사명 :</label>"
    	+ "<div class='col-sm-10'>"
    	+ "<input type='text' readonly class='form-control-plaintext modify-input' id='detail-com-name' value='"+responseData.com_name+"'>"
    	+ "</div>"
    	+ "</div>"
    	+ "<div class='form-group row'>"
    	+ "<label for='detail-com-addr' class='col-sm-2 col-form-label'>회사주소 :</label>"
    	+ "<div class='col-sm-10'>"
    	+ "<input type='text' readonly class='form-control-plaintext modify-input' id='detail-com-addr' value='"+responseData.com_addr+"'>"
    	+ "</div>"
    	+ "</div>"
    	+ "<div class='form-group row'>"
    	+ "<label for='detail-com-tel' class='col-sm-2 col-form-label'>회사번호 :</label>"
    	+ "<div class='col-sm-10'>"
    	+ "<input type='text' readonly class='form-control-plaintext modify-input' id='detail-com-tel' value='"+responseData.com_tel+"'>"
    	+ "</div>"
    	+ "</div>"
	    + "<div id='button_center'>";
	    if(isSearched == true){
	    	if(responseData.s_no == 1){
	    		detail_html += "<button type='button' class='btn btn-outline-success' onclick='updateInquiry(\""+responseData.inq_idx+"\", \""+responseData.email+"\", \""+currnetPage+"\", "+isSearched+");'>승인</button>&nbsp;&nbsp;";
	    	}
	    	detail_html += "<button type='button' class='btn btn-outline-warning' onclick='deleteInquiry(\""+responseData.inq_idx+"\", \""+currnetPage+"\", "+isSearched+");'>삭제</button>";
	    }else{
	    	detail_html += "<button type='button' class='btn btn-outline-success' onclick='updateInquiry(\""+responseData.inq_idx+"\", \""+currnetPage+"\", \""+isSearched+"\");'>승인</button>&nbsp;&nbsp;";
	    	detail_html += "<button type='button' class='btn btn-outline-warning' onclick='deleteInquiry(\""+responseData.inq_idx+"\", \""+currnetPage+"\", \""+isSearched+"\");'>삭제</button>";
	    }
	    detail_html += "</div>" 
	    + "</div>" //end card body
	    + "</div>" //end card
	    + "</div>"; //end col
		return detail_html;
}

function row_click(row, currnetPage, isSearched){
	isSearched = true;
	$('#inquiry-detail').hide();
	$('#inquiry-detail').show(1000);
	let class_id = $(row).prop('id');
	
	$.ajax({
		url: "inquiry_detail.json",
		method: "GET",
		data: {
			"inq_idx": class_id
		},
		dataType: "JSON",
		success: function(responseData){
			$('#inquiry-detail').html(showDetail(responseData, currnetPage, isSearched));
		}
	});
}

window.onload = function(){
	getInquiryList(1);
}

function getInquiryList(cp){
	$.ajax({
		url: "inquiry_list.json",
		method: "GET",
		data: {
			currentPage: cp
		},
		dataType: "HTML",
		success: function(responseData){
			$('#card-body-table').html(responseData);
		}
	});
}

function updateInquiry(inq_idx, email, currentPage, isSearched){
	$.ajax({
		url: "update_inquiry.json",
		method: "POST",
		//contentType: "application/json",
		data: {
			"inq_idx": inq_idx,
			"email" : email
		},
		dataType: "TEXT",
		success: function(responseData){
			if(responseData == "true"){
				$('#msg-alert').html(success_update_msg());
				$('#inquiry-detail').html("");
				setTimeout(function(){
					$('#msg-alert').html("");
				}, 5000);
				
				if(isSearched == true){
					search_word(currentPage);
				} else {
					getInquiryList(currentPage);
				}
			}
		}
	});
}
function deleteInquiry(inq_idx, currentPage, isSearched){
	$.ajax({
		url: "delete_inquiry.json",
		method: "POST",
		//contentType: "application/json",
		data: {
			"inq_idx": inq_idx,
		},
		dataType: "TEXT",
		success: function(responseData){
			if(responseData == "true"){
				
				$('#msg-alert').html(success_delete_msg());
				$('#inquiry-detail').html("");
				setTimeout(function(){
					$('#msg-alert').html("");
				}, 5000);
				
				if(isSearched == true){
					search_word(currentPage);
				} else {
					getInquiryList(currentPage);
				}
			}
		}
	});
}

function search_word(currentPage){
	let keyword = document.getElementById('search').value;
	let category = document.getElementById('category-search').value;
	$.ajax({
		url: "search_inquiry.json",
		type: "GET",
		data: {
			"currentPage": currentPage,
			"keyword": keyword,
			"category": category
		},
		dataType: "HTML",
		success: function(responseData){
			$('#card-body-table').html(responseData);
		}
	});
}

function success_delete_msg(){
	let msg = "";
	msg += "<div class='alert alert-success' role='alert'>"
		+ "<h4 class='alert-heading'>삭제 성공</h4>"
		+ "<p></p>"
		+ "</div>";
	return msg;
}
function success_update_msg(){
	let msg = "";
	msg += "<div class='alert alert-success' role='alert'>"
		+ "<h4 class='alert-heading'>승인 성공</h4>"
		+ "<p></p>"
		+ "</div>";
	return msg;
}
