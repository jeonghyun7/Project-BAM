/**
 * 
 */



////초기화함수
//function createXMLHttpRequest(){
//	if(window.XMLHttpRequest){
//	    xhttp = new XMLHttpRequest();
//	}else{
//	    // IE5, IE6 일때
//	    xhttp = new ActiveXObject("Microsoft.XMLHTTP");
//	}
//	return xhttp;
//}

//메인서비스로직
function emptyHeart(e){
	
	const strList = e.getAttribute('id').split('-');
	const camp_idx = strList[1];
	const email = document.getElementById("initMember").value;

	if(email===""){
		alert("로그인이 필요합니다.");
		location.href="../login/login.bam";
		return false;
	}
	
	const xhttp = new XMLHttpRequest(); // xmlHttpRequest생성
	
	xhttp.onreadystatechange = loader; //readystate에 변화가생기면 호출되는 함수
	xhttp.open('GET', '../heart/delete.bam?email='+email+'&camp_idx='+camp_idx, true); //post방식으로 연결
	xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8'); //http헤더에 들어가는 것
	xhttp.send();
	
	
	//콜백함수
	function loader() {
		try {
			if(xhttp.readyState === XMLHttpRequest.DONE) {
				var status = xhttp.status;
				if(status === 200) {
					let result = xhttp.responseText;
					if (result*1!==0) {
					    
						e.previousElementSibling.style.display = "inline";
						e.style.display = "none";
						alert("찜 목록에서 삭제되었습니다.");
					    
					}else{
						alert("해당 캠핑장에 찜 내역이 없습니다.");
					}
				}
			}
		}catch(exception) {
			alert('Caught Exception: ' + exception.description);
		}
	}

}


//메인서비스로직
function fillHeart(e){
	
	const buttonId = e.getAttribute('id');
	const strList = buttonId.split('-');
	const camp_idx = strList[1];
	const email = document.getElementById("initMember").value;
	
	if(email===""){
		alert("로그인이 필요합니다.");
		location.href="../login/login.bam";
		return false;
	}
	
	
	const xhttp = new XMLHttpRequest(); // xmlHttpRequest생성
	
	xhttp.onreadystatechange = loader2; //readystate에 변화가생기면 호출되는 함수
	xhttp.open('GET', '../heart/insert.bam?email='+email+'&camp_idx='+camp_idx, true); //get방식으로 연결
	xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8'); //http헤더에 들어가는 것
	xhttp.send();
	
	
	//콜백함수
	function loader2() {
		try {
			if(xhttp.readyState === XMLHttpRequest.DONE) {
				var status = xhttp.status;
				if(status === 200) {
					let result = xhttp.responseText;
					 if (result*1!==0) {
						 
						 e.nextElementSibling.style.display = "inline";
			        	 e.style.display = "none";
			        	 alert("찜 목록에 추가되었습니다.");
			        	 
			          } else {
			              alert("이미 찜한 캠핑장입니다.");
			          }
				}else{
					alert("request에 문제가 발생했습니다.");
				}
				
			}
			
	}catch(exception) {
		alert('Caught Exception: ' + exception.description);
	}

	}
	
}

