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
	let detail_html = "";
	detail_html += "<div class='card mb-3'>"
		+ "<div class='card-header'>"
		+ "<h3><i class='far fa-id-card bigfonts'></i> "+responseData.name+" - 회원 정보 수정</h3>"
		+ "정보를 수정 후 하단의 수정 버튼을 클릭해주세요."
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
	    +	"<label for='detail-birth' class='col-sm-2 col-form-label'>탈퇴일 :</label>"
	    + "<div class='col-sm-10'>"
	    + "<input type='text' readonly class='form-control-plaintext' id='detail-ldate' value='"+dataForm(responseData.ldate)+"'>"
	    + "</div>"
	    + "</div>"
	    + "<div id='button_center'>";
	    if(isSearched == true){
	    	detail_html += "<button type='button' class='btn btn-outline-warning' onclick='deleteMember(\""+responseData.email+"\", \""+currnetPage+"\", "+isSearched+");'>삭제</button>";
	    }else{
	    	detail_html += "<button type='button' class='btn btn-outline-warning' onclick='deleteMember(\""+responseData.email+"\", \""+currnetPage+"\", \""+isSearched+"\");'>삭제</button>";
	    }
	    detail_html += "</div>" 
	    + "</div>" //end card body
	    + "</div>" //end card
	    + "</div>"; //end col
		return detail_html;
}

function row_click(row, currnetPage, isSearched){
	$('#member-detail').hide();
	$('#member-detail').show(1000);
	let class_id = $(row).prop('id');
	
	$.ajax({
		url: "leave_member_datail.json",
		method: "GET",
		data: {
			email: class_id
		},
		dataType: "JSON",
		success: function(responseData){
			$('#member-detail').html(showDetail(responseData, currnetPage, isSearched));
		}
	});
}

window.onload = function(){
	getMemberList(1);
}

function getMemberList(cp){
	$.ajax({
		url: "leave_member.json",
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

function deleteMember(email, currentPage, isSearched){
	$.ajax({
		url: "delete_leave_member.json",
		method: "POST",
		//contentType: "application/json",
		data: {
			"email": email,
		},
		dataType: "TEXT",
		success: function(responseData){
			if(responseData == "true"){
				
				$('#msg-alert').html(success_msg(email));
				$('#member-detail').html("");
				setTimeout(function(){
					$('#msg-alert').html("");
				}, 5000);
				
				if(isSearched == true){
					search_word(currentPage);
				} else {
					getMemberList(currentPage);
				}
			}
		}
	});
}

function search_word(currentPage){
	let keyword = document.getElementById('search').value;
	let category = document.getElementById('category-search').value;
	$.ajax({
		url: "search_leave_member.json",
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

function success_msg(email){
	let msg = "";
	msg += "<div class='alert alert-success' role='alert'>"
		+ "<h4 class='alert-heading'>삭제 성공 => "+ email+"</h4>"
		+ "<p></p>"
		+ "</div>";
	return msg;
}