	let check_in;
	let total_fee;
	let pay_fee;
	let imp_uid;
	let point;
	let use_point;
	let save_point;
	let email;

function setVal(e){
	check_in = $("#check_in"+e).val();
	total_fee = $("#total_fee"+e).val();
	pay_fee = $("#pay_fee"+e).val();
	imp_uid = $("#imp_uid"+e).val();
	point = $("#my_point"+e).val();
	use_point = $("#use_point"+e).val();
	save_point = $("#save_point"+e).val();
	email = $("#email"+e).val();
	$(".total_fee"+e).text(total_fee.format());
	$(".pay_fee"+e).text(pay_fee.format());
	$(".use_point"+e).text(use_point.format());
	$(".save_point"+e).text(save_point.format());
	
	$.ajax({
		url: "../refund/refundableDate",
		type: "POST",
		data: {
			"check_in": check_in,
		},
		dataType: "json",
		success: function(result) {
			//[0] = today / [1] = 체크인 4일 전 / [2] 체크인 3일전 
			today = result[0];
			fourBefore = result[1];
			threeBefore = result[2];
			twoBefore = result[3];
			oneBefore = result[4];
			//console.log("0 : "+result[0]+", 1 : "+result[1]+", 2 : "+result[2]+", 3 : "+result[3]+",4 : "+result[4]);
			//console.log("0 : "+typeof result[0]+", 1 : "+typeof result[1]+", 2 : "+result[2]+", 3 : "+result[3]+",4 : "+result[4]);
			//console.log("today : "+today+", fourBefore : "+fourBefore+", threeBefore : "+threeBefore+", twoBefore : "+twoBefore+",oneBefore : "+oneBefore);
			$(".fourBefore"+e).text(fourBefore);
			$(".threeBefore"+e).text(threeBefore);
			if(today === threeBefore || today === twoBefore || today === oneBefore || today === check_in){
				 $(".bt_refund").text("환불 불가");
				 $(".bt_refund").attr("disabled", true);
				 $(".bt_refund").css('background-color','#bfbbbb');
				 $(".bt_refund").css('border-color','#bfbbbb');
			 }else{
				 $(".bt_refund").text("환불 요청");
				 $(".bt_refund").attr("disabled", false);
				 $(".bt_refund").css('background-color','#007bff');
				 $(".bt_refund").css('border-color','#007bff');
			 }
		},
		error: function(request, error){
			alert("error!!"+request.status+", message : "+request.responseText);
		}
	});
}


function cancelPay() {
	
	$.ajax({
		url: "../refund/refund",
		type: "POST",
		data: {
			"imp_uid": imp_uid, // 주문번호
			"point": point,
			"use_point": use_point,
			"save_point": save_point,
			"email": email
		},
		dataType: "json",
		success: function(result) {
			window.location.href="./mypage.bam?selected=booking";
		},
		error: function(request, error){
			alert("error!!"+request.status+", message : "+request.responseText);
		}
	});
}
