/**
 * 
 */
function uploadCamp(){
	let length = document.getElementsByClassName('check').length;
	console.log(length);
	
	//var reg = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/;
	let reg = /(.*?)\.(jpg|png|JPG|PNG)$/;
	for(let i=0; i<document.getElementsByClassName('file').length; i++){
		let file = document.getElementsByClassName('file')[i].value;
		if(!file.match(reg)){
			document.getElementsByClassName('file')[i].focus();
			alert("지정된 확장자의 파일만 업로드 가능합니다. (.png .jpg)");
			return false;
		}
	}
	
	
	for(let k=0; k<length; k++){
		if(document.getElementsByClassName('check')[k].value == ""){
			$('.check')[k].focus();
			alert("모든 정보를 입력해 주세요.");
			return false;
		}
	}
	
	if(document.getElementById('chb50').checked == false){
		$('#chb50').focus();
		alert("서비스 정책에 동의해 주세요");
		return false;
	}
	
	let conv = "";
	let sec_conv = "";
	let etc_conv = "";
	for(let i=0; i<document.getElementsByName('conv').length; i++){
		if(document.getElementsByName('conv')[i].checked){
			conv += document.getElementsByName('conv')[i].value;
			conv += ",";
		}
		if(i == (document.getElementsByName('conv').length-1)){
			//slice의 두번째 매개변수에 음수를 사용하면 뒤에서부터 잘려나간다 (마지막 ',' 제거)
			conv = conv.slice(0, -1);
		}
	}
	for(let i=0; i<document.getElementsByName('sec-conv').length; i++){
		if(document.getElementsByName('sec-conv')[i].checked){
			sec_conv += document.getElementsByName('sec-conv')[i].value;
			sec_conv += ",";
		}
		if(i == (document.getElementsByName('sec-conv').length-1)){
			//slice의 두번째 매개변수에 음수를 사용하면 뒤에서부터 잘려나간다 (마지막 ',' 제거)
			sec_conv = sec_conv.slice(0, -1);
		}		
	}
	for(let i=0; i<document.getElementsByName('etc-conv').length; i++){
		if(document.getElementsByName('etc-conv')[i].checked){
			etc_conv += document.getElementsByName('etc-conv')[i].value;
			etc_conv += ",";
		}
		if(i == (document.getElementsByName('etc-conv').length-1)){
			//slice의 두번째 매개변수에 음수를 사용하면 뒤에서부터 잘려나간다 (마지막 ',' 제거)
			etc_conv = etc_conv.slice(0, -1);
		}
	}
	
	if(document.getElementById('bbq-price').value == ""){
		document.getElementById('bbq-price').value = 0;
	}
	
	let params = {
		'camp.camp_name': document.getElementById('camp-name').value,
		'camp.address': document.getElementById('sample5_address').value,
		'camp.camp_tel': document.getElementById('phoneNum').value,
		'camp.site_num': document.getElementById('site-num').value,
		'camp.full_num': document.getElementById('full-num').value,
		'camp.parking': document.getElementById('parking').value,
		'camp.conv': conv,
		'camp.sec_conv': sec_conv,
		'camp.etc_conv': etc_conv,
		'camp.agency_tel': document.getElementById('agency-tel').value,
		'camp.agency_name': document.getElementById('agency-name').value,
		'camp.bbq_fee': stringNumberToInt(document.getElementById('bbq-price').value)
	};
	
	let form = document.getElementById("submit-form");
	
	for(let key in params){
		let hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", key);
		hiddenField.setAttribute("value", params[key]);
		form.appendChild(hiddenField);
	}
	
	let numberToInt = document.getElementsByClassName('camp-price');
	for(let i=0; i<numberToInt.length; i++){
		let val = stringNumberToInt(numberToInt[i].value);
		numberToInt[i].value = val;
	}
	
	form.submit();
}

function add_inputs(){
	let num = Number(document.getElementById('current-site-size').value);
	more_input_html(num);
	num += 1;
	//console.log(num);
	$('#count-site').text("("+num+")");
	document.getElementById('current-site-size').value = num;
}

//deprecated - json 형태로 ajax를 통한 비동기 통신 해보기
function test(){
	let request_data_list = new Array();
//	for(let i=0; i<1; i++){
//		let data = new Object();
//		data.sort_idx = "";
//		data.camp_idx = "";
//		data.sort_name = "";
//		data.site_name = "";
//		data.people_num = "";
//		data.site_fee = "";
//		data.site_img = "";
//	}
	//document.getElementById('submit-form').submit();
}


function remove_inputs(){
	let num = Number(document.getElementById('current-site-size').value);
	if(num > 1){
		num -= 1;
		let e = document.getElementById('site'+num);
		document.getElementById('site-size-box').removeChild(e);
		$('#count-site').text("("+num+")");
	}else{
		return;
	}
	document.getElementById('current-site-size').value = num;
}

function more_input_html(index){
	let more_html = "";
	more_html += ""
			+ "<div id='site"+index+"' class='billing-form-item'>"
			+ "<div class='billing-content'>"
			// 1 
			+ "<label class='label-text'>캠핑 사이트 이름 <i	class='la la-question tip ml-1' data-toggle='tooltip'"
			+ "data-placement='top' title='해당 구역 이름'></i></label>"
			+ "<div class='form-group'>"
			+ "<span class='la la-pencil form-icon'></span>"
			+ "<input id='site-name"+index+"' name='sort["+index+"].site_name' class='message-control form-control check' style='height: 50px'"
			+ "placeholder='캠핑 사이트 이름을 입력해주세요.'>"
			+ "</div>"
			
			//custom-checkbox 
			+ "<label class='label-text'>종류 </label>"
			+ "<div class='billing-form-item'>"
			+ "<div class='billing-content'>";
		let sort_name = ["오토캠핑", "글램핑", "카라반", "노지캠핑", "기타"];
		for(let i=0; i<sort_name.length; i++){
			more_html += "<div class='custom-checkbox' style='margin-bottom: 0px;'>"
			+ "<input type='checkbox' id='chk-sort-"+i+"-"+index+"' class='choice-sort' value='"+sort_name[i]+"' onClick='chooseOnlyOneSort(this, "+index+");''> <label"
			+ " for='chk-sort-"+i+"-"+index+"'>"+sort_name[i]+"</label>"
			+ "</div>";
		}
		more_html += "<div id='etc-input-area-"+index+"' class='form-group' style='margin-bottom: 0px;'>"
			+ "</div>"
			+ "</div>"
			+ "</div>"
			
			// 2 
			+ "<label class='label-text'>해당 사이트 수용 인원 </label>"
			+ "<div class='form-group'>"
			+ "<span class='la la-pencil form-icon'></span>"
			+ "<input id='people-num"+index+"' name='sort["+index+"].people_num' class='message-control form-control check' style='height: 50px'"
			+ "placeholder='해당 사이트 내 수용 가능한 인원을 입력해주세요.'>"
			+ "</div>"
			// 3 
			+ "<label class='label-text'>해당 사이트 이용 가격 </label>"
			+ "<div class='form-group'>"
			+ "<span class='la la-won form-icon'></span>"
			+ "<input id='site-fee"+index+"' class='form-control camp-price check' type='text'"
			+ "name='sort["+index+"].site_fee' placeholder='캠핑장 가격을 정확히 입력해 주세요'>"
			+ "</div>"
			// 4
			+ "<label class='label-text'>해당 사이트 사진 <i	class='la la-file-image-o tip ml-1' data-toggle='tooltip'"
			+ "data-placement='top' title='캠핑장 관련 상세 사진들을 선택해주세요(.png .jpg)'></i></label>"
			+ "<div class='form-group'>"
			+ "<input id='site-img"+index+"' class='check' type='file' name='sort["+index+"].site_img' accept='.png, .jpg, .PNG, .JPG'>"
			+ "</div>"
			+ "</div>"
			//end billing-content 
			+ "</div>";
			//end billing-form-item 
		
		//checkbox form data
		let checked_data_form = document.createElement('input');
		checked_data_form.setAttribute('id', 'checked-data-'+index);
		checked_data_form.setAttribute('class', 'check');
		checked_data_form.setAttribute('type', 'hidden');
		checked_data_form.setAttribute('name', "sort["+index+"].sort_name");
		checked_data_form.setAttribute('value', '');
		$('#site-size-box').append(more_html);
		$('#site'+index).append(checked_data_form);
	
	//포인트 입력 시 자동으로 ',(콤마)' 입력
	$(".camp-price").bind('keyup', function(e) {
		var rgx1 = /\D/g;
		var rgx2 = /(\d+)(\d{3})/;
		var num = this.value.replace(rgx1, "");

		while (rgx2.test(num))
			num = num.replace(rgx2, '$1' + ',' + '$2');
		this.value = num;
	});
	
    /*====  Tooltip =====*/
    $('[data-toggle="tooltip"]').tooltip();
}

function chooseOnlyOneSort(check, index){
	//console.log("index : "+$('.choice-sort').index(check));
	let obj = document.getElementsByClassName('choice-sort');
	
	let index_of_class = $('.choice-sort').index(check);
	let temp = parseInt(index_of_class/5);
	let end = (temp+1)*5;
	let start = end-5;
	for(let i=start; i<end; i++){
		if(obj[i] != check){
			obj[i].checked = false;
		}
	}
	
	if(check.checked == false){
		$('#etc-input-area-'+index).html("");
	}else if(check.value == "기타"){
		let input_icon = document.createElement('span');
		input_icon.setAttribute('class', 'la la-pencil form-icon');
		let new_input = document.createElement('input');
		new_input.setAttribute('id', 'new-sort-'+index);
		new_input.setAttribute('class', 'form-control form-control-sm');
		new_input.setAttribute('type', 'text');
		new_input.setAttribute('placeholder', '기타 원하는 캠핑장 종류명을 입력해 주세요');
		$('#etc-input-area-'+index).html(input_icon);
		$('#etc-input-area-'+index).append(new_input);
	}else if(check.value != "기타"){
		let init = "";
		$('#etc-input-area-'+index).html(init);	
	}
	//서버에 보낼 체크박스 히든 데이터
	//기타박스 체크 후 데이터 입력( input  데이터 -> hidden 요소 data )
	$('#new-sort-'+index).keyup(function(){
		let data = document.getElementById('new-sort-'+index).value;
		 document.getElementById('checked-data-'+index).value = data;
		 //console.log($('#checked-data-'+index).val());
	});
	//체크박스를 체크했을 때( 체크박스 data -> hidden 요소 data )
	let checked_data_form = document.getElementById('checked-data-'+index);
	//console.log("check : "+check.value);
	checked_data_form.setAttribute('value', check.value);
	console.log("checked_value : "+checked_data_form.value);
}

//포인트 입력 시 자동으로 ',(콤마)' 입력
$(".camp-price").bind('keyup', function(e) {
	var rgx1 = /\D/g;
	var rgx2 = /(\d+)(\d{3})/;
	var num = this.value.replace(rgx1, "");

	while (rgx2.test(num))
		num = num.replace(rgx2, '$1' + ',' + '$2');
	this.value = num;
});



