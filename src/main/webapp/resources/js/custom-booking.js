const sessionItem = JSON.parse(sessionStorage.getItem("bookingInfo"));
var use_point_type_num = 0;
var my_point_type_num = 0;
var after_payment_my_point = 0;
var service_fee_type_num = 0;
var campPrice;
var bbq_fee_type_num=0;
var camp_total_type_num=0;

$(document).ready(function(){
	
	var my_point = $("#my_point").text();
	$("#my_point").text(function() {//1000단위 컴마처리
	    $(this).text(
	        $(this).text().format()
	    );
	});
	
	my_point_type_num = stringNumberToInt(my_point)//컴마 붙은 포인트 숫자형으로 바꿔줌(ex 1,000->1000)
	
	thumb = localStorage.getItem("thumb");
	avgStar = localStorage.getItem("avgStar");
	
	$("#camp_thumb").attr("src", "/images/camp-img/thumb/"+thumb);
	$("#avgStar").text(avgStar);
	$("#campName").append(sessionItem.campName);
	$("#campAddress").append(sessionItem.address);
	
	/*날짜 몇 박 며칠인지 구하기*/
	dateTemp = sessionItem.checkDate.split("-");
    checkInDate = dateTemp[0]; 
    checkOutDate = dateTemp[1]; 
    
    checkInTemp = checkInDate.split("/");
    checkOutTemp = checkOutDate.split("/");
    checkIn = new Date(checkInTemp[0], checkInTemp[1]-1, checkInTemp[2]);
    checkOut = new Date(checkOutTemp[0], checkOutTemp[1]-1, checkOutTemp[2]);
    night = (checkOut-checkIn)/(24 * 3600 * 1000);
    days = night+1;
    $(".booking_date").append(sessionItem.checkDate+" ("+night+"박 "+days+"일)");
	
    
    
	$(".peopleNum").append(sessionItem.peopleNum+"명");
	campPrice = stringNumberToInt(sessionItem.campPrice)*night;
	$(".camp_fee").append(campPrice);
	$(".camp_fee").text(function() {//1000단위 컴마처리
	    $(this).text(
	        $(this).text().format()
	    );
	});

    var camp_fee_type_num = stringNumberToInt($('.camp_fee').eq(0).text());
    $(".bbq_fee").append(sessionItem.bbqPrice);
    bbq_fee_type_num = stringNumberToInt($('.bbq_fee').eq(0).text());
    
    /*서비스 수수료 계산(천단위 올림)*/
    service_fee_type_num = Math.ceil((camp_fee_type_num*0.01)/1000)*1000;
    var service_fee = service_fee_type_num.format();
    $(".service_fee").append(service_fee);
    
    /*포인트 사용 전 토탈 금액 띄우기*/
    camp_total_type_num = (camp_fee_type_num)+(bbq_fee_type_num)+(service_fee_type_num);
    var camp_total = camp_total_type_num.format();
    $(".camp_total").text(camp_total);
    
    
  	/*포인트 입력 시 1.컴마 처리 2.포인트값 띄우기 3.포인트 값 뺀 총액 띄우기*/
	$("input[id='point']").bind('keyup', function(e){
		var rgx1 = /\D/g;
		var rgx2 = /(\d+)(\d{3})/;
		var num = this.value.replace(rgx1,"");
		
		while (rgx2.test(num)) num = num.replace(rgx2, '$1' + ',' + '$2');
		this.value = num;
		use_point_type_num = stringNumberToInt(this.value);
		if(use_point_type_num>my_point_type_num&my_point_type_num>=camp_total_type_num){//입력한 포인트 값이 보유한 포인트값보다 크거나 같고, 입력한 포인트가 총액보다 클 때 포인트 값을 결제할 총 액으로 설정
			this.value =camp_total_type_num.format();
			$("#use_point").text(camp_total_type_num.format());
			 camp_total = (camp_total_type_num-camp_total_type_num).format();
			
			 $(".camp_total").text(camp_total);
			 after_payment_my_point = my_point_type_num-use_point_type_num;
			 console.log(">>>1: use_point_type_num : "+use_point_type_num);
			if(after_payment_my_point<0){
				after_payment_my_point = my_point_type_num - camp_total_type_num;
				$("#my_point").text(after_payment_my_point.format());
				setPoint();
				return false;
			}
		}else if(use_point_type_num>my_point_type_num&my_point_type_num<=camp_total_type_num){//사용할 포인트>보유포인트 && 보유포인트<=결제할 총 액
			this.value =my_point_type_num.format();
			$("#use_point").text(my_point_type_num.format());
			camp_total = (camp_total_type_num-my_point_type_num).format();
			$(".camp_total").text(camp_total);
			//$("#my_point").text(my_point_type_num-use_point_type_num);
			console.log(">>>2: use_point_type_num : "+use_point_type_num);
			after_payment_my_point = my_point_type_num-use_point_type_num;
			if(after_payment_my_point<0){
				after_payment_my_point=0;
				$("#my_point").text(after_payment_my_point);
				setPoint();
				return false;
			}
		}else{
			console.log(">>>3: use_point_type_num : "+use_point_type_num);
			$("#use_point").text(this.value);
			if(isNaN(use_point_type_num)){
				use_point_type_num=0;
			}
			camp_total = (camp_total_type_num-use_point_type_num).format();
	        $(".camp_total").text(camp_total);
	        // $("#my_point").text(my_point_type_num-use_point_type_num);
	        after_payment_my_point = my_point_type_num-use_point_type_num;
		}
			$("#my_point").text(after_payment_my_point.format());
			setPoint();
	});
	
	/*포인트 전액 사용 버튼 클릭 시 1.포인트 값 띄우기 2.포인트 값 뺀 총액 띄우기*/
	$("#bt_use_point").click(function(){
		$("#use_point").text(my_point.format());
		my_point_type_num = stringNumberToInt(my_point);
		$("#point").val(my_point_type_num.format());
		var camp_total_type_num = (camp_fee_type_num)+(bbq_fee_type_num)+(service_fee_type_num);
		
		if(my_point_type_num>=camp_total_type_num){//전액 포인트 값이 총 결제 액보다 크거나 같을 때 포인트 값을 총 결제 액으로 설정해주기 and 총결제 액 0원으로 설정
			this.value=camp_total_type_num;
			$("#point").val(camp_total_type_num.format());
			$("#use_point").text(this.value.format());
			var total = 0;
		    $(".camp_total").text(total);
		    console.log("포인트 전액 사용 버튼 눌렀을 때(포인트>총액) : "+((my_point_type_num)-(camp_total_type_num)));
		    console.log("1/포인트 전액 사용 버튼 눌렀을 때(포인트>총액) : "+my_point_type_num+" > "+camp_total_type_num);
		    after_payment_my_point = my_point_type_num-camp_total_type_num;
		}else{
			var use_point =my_point_type_num;
			var total = (camp_total_type_num)-(use_point);
			var camp_total_type_num = total.format();
		    $(".camp_total").text(camp_total_type_num);
		    console.log("포인트 전액 사용 버튼 눌렀을 때(포인트<총액) : "+(my_point_type_num-use_point));
		    console.log("2/포인트 전액 사용 버튼 눌렀을 때(포인트<총액) : "+my_point_type_num+" > "+use_point);
		    after_payment_my_point = my_point_type_num-use_point;
		}
		$("#my_point").text(after_payment_my_point.format());
		setPoint();
	});
    
	
    /*전체 동의 클릭 시 전체 선택되는 function*/
    $("#camp_thumb").attr("src", sessionItem.imgTest);//setAttr
    $("#chbAll").click(function(){
        if($("#chbAll").prop("checked")){
            $("input[name=chb]").prop("checked",true);
            $bt_pay = $("#bt_pay").attr("disabled", false);
	   		 $("#bt_pay").css('background-color','#ff6b6b');
			 $("#bt_pay").css('border-color','#ff6b6b');
        }else{
            $("input[name=chb]").prop("checked",false);
            $bt_pay = $("#bt_pay").attr("disabled", true);
	   		 $("#bt_pay").css('background-color','#bfbbbb');
			 $("#bt_pay").css('border-color','#bfbbbb');
        }
    });
    
    /*모든 체크박스가 체크되었을 때 결제하기 버튼이 활성화*/
    $(".chb").click(function(){
    	if($("input:checkbox[id='chb1']").is(":checked") &
    		$("input:checkbox[id='chb2']").is(":checked") &
    		$("input:checkbox[id='chb3']").is(":checked") &
    		$("input:checkbox[id='chb4']").is(":checked") &
    		$("input:checkbox[id='chb5']").is(":checked")
    	){
		 $bt_pay = $("#bt_pay").attr("disabled", false);
		 $("#bt_pay").css('background-color','#ff6b6b');
		 $("#bt_pay").css('border-color','#ff6b6b');
    	}else{
    		 $bt_pay = $("#bt_pay").attr("disabled", true);//전체 동의 안 하면 결제하기 버튼 비활성화
    		 $("#bt_pay").css('background-color','#bfbbbb');
    		 $("#bt_pay").css('border-color','#bfbbbb');
    	}
	});
    
    /*서비스 수수료 클릭 시 안내*/
	$("#charge").on("click", function(){
		$("#charge").popover('toggle');
		// destroy 함수도 존재하는데 이는 popover를 해제하는 함수이다.
	});
	
	
	$("#rules_area1").hide();
    /*이용 약관 보기 버튼 클릭 시 상세규칙 안내*/
    $("#bt_use").click(function(){//이용규칙 동의 상세내역 띄우기
		$("#rules_area1").load("/common/rules_of_use.txt", function(p1, p2, p3){
			//alert("p1 : "+p1+" ,p2 : "+p2+" ,p3 : "+p3);
			if(p2 == "success"){
				$("#rules_area1").toggle(500);
				//alert("성공");
				//alert("status : "+p3.status+", readyState : "+p3.readyState);
			}
			if(p2 == "error"){
				//alert("실패");
				//alert("p1: "+p1+"status : "+p3.status+", readyState : "+p3.readyState);
			}
		});
	});
    
    	
    $("#rules_area2").hide();
     $("#bt_refund").click(function(){//취소 및 환불 규칙 동의 상세내역 띄우기
		$("#rules_area2").load("/common/refund.txt",function(p1, p2, p3){
			if(p2 == "success"){
				$("#rules_area2").toggle(500);
			}
		});
	});
     
    $("#rules_area3").hide();     
    $("#bt_privacy").click(function(){//개인정보 수집 및 이용 동의 상세내역 띄우기
		$("#rules_area3").load("/common/privacy.txt",function(p1, p2, p3){
			if(p2 == "success"){
				$("#rules_area3").toggle(500);
			};
		});
	});
    
    $("#rules_area4").hide();
    $("#bt_privacy3").click(function(){//개인정보 제3자동의 상세내역 띄우기
		$("#rules_area4").load("/common/privacy3.txt",function(p1, p2, p3){
			if(p2 == "success"){
				$("#rules_area4").toggle(500);
			};
		});
	});
    
    
    /* 전화번호 하이픈  */
    var autoHypenPhone = function(str){
          str = str.replace(/[^0-9]/g, '');
          var tmp = '';
          if( str.length < 4){
              return str;
          }else if(str.length < 7){
              tmp += str.substr(0, 3);
              tmp += '-';
              tmp += str.substr(3);
              return tmp;
          }else if(str.length < 11){
              tmp += str.substr(0, 3);
              tmp += '-';
              tmp += str.substr(3, 3);
              tmp += '-';
              tmp += str.substr(6);
              return tmp;
          }else{              
              tmp += str.substr(0, 3);
              tmp += '-';
              tmp += str.substr(3, 4);
              tmp += '-';
              tmp += str.substr(7);
              return tmp;
          }
      
          return str;
    }

    var phoneNum = document.getElementById('phone_num');
    
    phoneNum.onkeyup = function(){
      this.value = autoHypenPhone( this.value ) ;  
    		let buyer_tel = document.getElementById("phone_num").value;
    		document.getElementById("buyer_tel").value=buyer_tel;
    		//console.log(this.value);
    }
    
    //사용할 포인트를 입력하지 않았을 경우 원래의 포인트로 설정
    after_payment_my_point = my_point_type_num;
    
})

