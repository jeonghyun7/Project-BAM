
// 비밀번호 재확인 스크립트


    $(function(){
        $("#alert-success").hide();
        $("#alert-danger").hide();
        $("#pwd-danger").hide();
        $("#pwdCheck").blur(function(){
	console.log("1");
            var pwd=$("#pwd").val();
            var pwdCheck=$("#pwdCheck").val();
            if(pwd != "" || pwdCheck != ""){
                if(pwd == pwdCheck){
                	console.log("2");
                    $("#alert-success").show();
                    $("#alert-danger").hide();
                    $("#submit").removeAttr("disabled");
                }else{
                	console.log("3");
                    $("#alert-success").hide();
                    $("#alert-danger").show();
                    $("#submit").attr("disabled", "disabled");
                }    
            }
        });
    });

// 비밀번호 정규식
 
// 비밀번호 패턴 체크 (8자 이상, 문자, 숫자, 특수문자 포함여부 체크) 
$("#pwd").keyup(function(){
    checkPassword($('#pwd').val());
});
function checkPassword(pwd){
    
    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pwd)){            
        //alert('숫자, 영문자, 특수문자 조합으로 8자리 이상 사용해야 합니다.');
        //$('#pwd').val('').focus();
        $("#pwd-danger").show();
        return false;
    }else{
    	$("#pwd-danger").hide();
    }
    
    
    if(/(\w)\1\1\1/.test(pwd)){
        alert('같은 문자나 숫자를 4번 이상 사용하실 수 없습니다.');
        //$('#pwd').val('').focus();
        return false;
    }
    
    return true;
}



let check_email = false;
let prev_email = "";
 /* 이메일 체크  */   
 // email check function
    function is_correct_email_format(email) {    
        var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        return (email != '' && email != 'undefined' && regex.test(email)); 
    }
    
    $("#result-check").hide();
    $("#email-check").hide();
    
    function email_check(email){
      // if value is empty then exit
      if( email == '' || email == 'undefined') return;

      // valid check
      if(! is_correct_email_format(email) ) {
      	$("#result-check").show();
      	var html="<div>이메일 형식에 맞춰 입력해 주세요</div>";
      	$("#email-check").hide();
		$('#result-check').empty();
		$('#result-check').append(html);
        $(this).focus();
        return false;
      } else {
    	$("#result-check").hide();
    	
    	$.ajax({
				url : "email_check.bam",
				type : "POST",
				data : {
					"realemail" : $('#realemail').val()
				},
				success : function(result) {
					$("#email-check").hide();
					//console.log("realemail"+ realemail);
					if (result == 0 && $.trim($('#realemail').val()) !== '') {
						idx = true;
						//$('#email2').attr("readonly",true);
						$("#email-check").show();
						var html = "<div>사용 가능한 아이디입니다 </div>";
						$('#email-check').empty();
						$('#email-check').append(html);
						check_email = true;
						prev_email = email;
					} else {
						$("#email-check").hide();
						$("#result-check").show();
						var html = "<div>이미 사용중인 아이디입니다 </div>";
						$('#result-check').empty();
						$('#result-check').html(html);
						check_email = false;
						prev_email = email;
					}
				},
				error : function() {
					alert("서버에러");
				}
			});
      	
      }
    }
    
    // check when email input lost focus
    $(".input-check-email").blur(function(){
      let email = $(this).val();
      email_check(email);
      
    });
    
    $('#check').click(function(){
    	let email = $('#realemail').val();
    	email_check(email);
    })
    
    function submit_form(){
    	let pwd = $('#pwd').val();
    	let pwdCheck = $('#pwdCheck').val();
    	let current_email = $('#realemail').val();
    	if(pwd == pwdCheck && check1 == check2 && check_email && current_email == prev_email){
    		document.getElementById('sign-up-form').submit();
    	} else if(!check_email || current_email != prev_email){
    		email_check(current_email);
    	}
    }
    
    
   
   
/* 로그인 이메일 체크  */   
 // login email check function
    function email_login( email2 ) {    
        var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        return (email2 != '' && email2 != 'undefined' && regex.test(email2)); 
    }
    $("#result-check2").hide();
    // check when email input lost focus
    $(".input-check-email2").blur(function(){
    
      var email2 = $(this).val();
      
      // if value is empty then exit
      if( email2 == '' || email2 == 'undefined') return;

      // valid check
      if(! email_login(email2) ) {
      	$("#result-check2").show();
        $(this).focus();
        return false;
      }
      else {
    	$("#result-check2").hide();
      }
    });
  
    




let check1=false;
let check2=false;

function checked_box(check_box){
	if(check_box.value == 13){
		check1 = check_box.checked
	}else{
		check2 = check_box.checked
	}
	
	let btn = $('#sign-up-btn');
	if(check1 && check2){
		console.log("success");
		//첫번째 -> disabled 풀어주기
		btn.prop("disabled", false);
		//두번째 -> style 색상 변경
		btn.removeAttr("style");
		btn.attr("style", "cursor:pointer");
	}else{
		//첫번째 -> disabled 걸기
		btn.prop('disabled', true);
		//두번째 -> style 색상 변경
		btn.attr("style", "background-color:#b0b0b0");	
	}
}


$(function(){
	$('#textfile').hide();
	$('#aid').click(function(){
		//텍스트 파일 읽어오기
		//지금은 우리가 서버에서 데이터를 생성해서 리턴을 못하기 때문에 파일을 만들어서 읽지만 
		//나중에는 파일 이름을 적지 않고 URL을 기재해서 데이터를 읽어올 것이다.
		$('#textfile').load('/common/text.txt', function(p1, p2, p3){
		if(p2 == "success"){
			$('#textfile').toggle(500);
			//alert("성공");
			//alert("status : "+p3.status+", readyState : "+p3.readyState);
		}
		if(p2 == "error"){
		}
		});
	});
})

$(function(){
	$('#textfile2').hide();
	$('#aid2').click(function(){
		$('#textfile2').load('/common/text.txt', function(p1, p2, p3){
		if(p2 == "success"){
			$('#textfile2').toggle(500);
		}
		if(p2 == "error"){
		}
		});
	});
})

