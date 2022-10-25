/**
 * 
 */
function getTotalValues(isCount){
	$.ajax({
		url: "main.json",
		method: "GET",
		data: {},
		dataType: "JSON",
		error: function(){
			clearInterval(playAlert);
		},
		success: function(responseData){
//			console.log("통신 성공");
//			console.log("totalMember : "+responseData.totalMember);
//			console.log("totalCamp : "+responseData.totalCamp);
//			console.log("totalBooking : "+responseData.totalBooking);
//			console.log("totalInquiry : "+responseData.totalInquiry);
//			console.log("totalLMember : "+responseData.totalLMember);
//			console.log("totalCurrentBooking : "+responseData.totalCurrentBooking);
//			console.log("totalUncheckedInquiry : "+responseData.totalUncheckedInquiry);
			
			$('#total-booking').text(responseData.totalBooking);
			//$('#total-booking').text("1,500");
			$('#total-current-booking').text("최근 예약 : "+responseData.totalCurrentBooking);
			$('#total-camp').text(responseData.totalCamp);
			$('#total-login-member').text(responseData.totalLoginMember);
			$('#total-inquiry').text(responseData.totalInquiry);
			$('#total-unchecked-inquiry').text("미처리 : "+responseData.totalUncheckedInquiry);
			
			if(isCount){
				// counter-up
				$('.counter').counterUp({
					delay: 10,
					time: 1000,
				   // offset: 70,
				    //beginAt: 500,
//				    formatter: function(n){
//				    	return n.replace(/,/g, '.');
//				    }
				});
			} 
			
		}
	});
}

function getCurrentDate(){
	let date = new Date();
    let nowYear = date.getFullYear();
    let nowMonth = date.getMonth() + 1;
    let nowDate = date.getDate();
    if (nowMonth < 10) {
        nowMonth = "0" + nowMonth;
    }
    if (nowDate < 10) {
        nowDate = "0" + nowDate;
    }
	let update_date = nowYear+"년 "+nowMonth+"월"+nowDate+"일 | "+date.getHours()+"시 "+date.getMinutes()+"분 "+date.getSeconds()+"초";
	//console.log("time : "+update_date);
	return update_date;
}



let todaySales = 0;
let yesterdaySales = 0;
let totalSales = 0;
let increment = 0;
let decrement = 0;
let target = 0;

let totalMember = 0;
let totalLeaveMember = 0;

function getLineChartValues(isAsync){
	$.ajax({
		url: "today_sales", 
		async: isAsync,
		type: "POST",
		contentType: "application/json",
		data: {},
		dataType: "JSON",
		success: function(responseData){
			let isChanged = false;
			if(Number(responseData.todaySales) != todaySales || Number(responseData.yesterdaySales) != yesterdaySales){
				isChanged = true;
				
				todaySales = Number(responseData.todaySales);	
				yesterdaySales = Number(responseData.yesterdaySales);
				totalSales = todaySales + yesterdaySales;
				
				if(todaySales > yesterdaySales){
					target = yesterdaySales;
					increment = todaySales - yesterdaySales;
					decrement = 0;
				} else if(todaySales == yesterdaySales) {
					target = todaySales;
					increment = 0;
					decrement = 0;
				} else {
					target = todaySales;
					increment = 0;
					decrement = todaySales - yesterdaySales;
				}
			}
			
			if(isChanged){
				document.getElementById('line-update-date').innerText = getCurrentDate();
			}
			
		}
	});
}


function getPieChartValues(isAsync){
	$.ajax({
		url: "total_member", 
		async: isAsync,
		type: "POST",
		contentType: "application/json",
		data: {},
		dataType: "JSON",
		success: function(responseData){
			let isChanged = false;
			if(Number(responseData.totalMember) != totalMember || Number(responseData.totalLeaveMember) != totalLeaveMember){
				isChanged = true;
				totalMember = Number(responseData.totalMember);
				totalLeaveMember = Number(responseData.totalLeaveMember);
			}
			
			if(isChanged){
				document.getElementById('pie-update-date').innerText = getCurrentDate();
			}
			
		}
	});
}

let lineChart;
let pieChart;
function getCharts(isAnimated){
	getLineChartValues(false);
	let animationTime = 0;
	
	if(isAnimated){
		animationTime = 3000;
	}
	
	let colums = ["비교", "어제", "오늘"];
	//colums.push("총매출");
	
	let lineData = {
			labels: colums,
			datasets: [{
					label: '매출액',
					backgroundColor: '#3EB9DC',
					data: [target, yesterdaySales, todaySales] 
				}, 
				{
					label: '감소',
					backgroundColor: '#FF6363',
					data: [decrement]
				},
				{
					label: '증가',
					backgroundColor: '#C2E0FF',
					data: [increment]
				}]
		};
	
	let ctx1 = document.getElementById("lineChart").getContext('2d');
	lineChart = new Chart(ctx1, {
		type: 'bar',
		data: lineData,
		options: {
						tooltips: {
							mode: 'index',
							intersect: true
						},
						animation: {
							duration : animationTime
						},
						responsive: true,
						scales: {
							xAxes: [{
								stacked: true,
							}],
							yAxes: [{
								stacked: true,
								display: true,
								scaleLabel: {
									display: true,
									labelString: '(원)'
								}
							}]
						}
					}
	});
	

	getPieChartValues(false);
	let pieData = [totalMember, totalLeaveMember];
	
	let ctx2 = document.getElementById("pieChart").getContext('2d');
	pieChart = new Chart(ctx2, {
		type: 'pie',
		data: {
				datasets: [{
					data: pieData,
					backgroundColor: [
						'rgba(54, 162, 235, 1)',
						'rgba(255,99,132,1)',
					],
					label: 'Dataset 1'
				}],
				labels: [
					"회원",
					"탈퇴회원",
				]
			},
			options: {
				responsive: true
			}
	});

}

function getLoginMembers(isAsync){
	$.ajax({
		url: "login_members", 
		async: isAsync,
		type: "POST",
		contentType: "application/json",
		dataType: "JSON",
		success: function(responseData){
			if(responseData == null){
				console.log("NULL");
			} else{
				let html = "";
				for(let i=0; i<responseData.length; i++){
					html += getTableHTML(responseData[i]);
				}
				$('#login-member').html(html);
			}
		}
	});
}

function getTableHTML(data){
	let diffSeconds = "";
	let diffMinutes = ""; 
	let diffHours = "";
	let diffDate = "";
	for(let i=0; i<data.differTime.length; i++){
		if(i == 0) diffSeconds = data.differTime[0];
		if(i == 1) diffMinutes = data.differTime[1];
		if(i == 2) diffHours = data.differTime[2];
		if(i == 3) diffDate = data.differTime[3];
	}
	let html = "";
	html += "<a href='#'>"
		+"<div class='message-item'>"
		+"<div class='message-user-img'><img src='/admin/images/default-user.png' class='avatar-circle' alt=''></div>"
		+"<p class='message-item-user'>"+data.name+"</p>"
		+"<p class='message-item-msg'><span style='color:#43e080'><i class='fas fa-user-check'></i>  로그인</span><br/>";
		if(diffDate == "0" && diffHours == "0" && diffMinutes == "0"){
			html += diffSeconds+"초 전</p>";
		} else if(diffDate == "0" && diffHours == "0"){
			html += diffMinutes+"분 전</p>";
		}else if(diffDate == "0"){
			html += diffHours+"시간 "+diffMinutes+"분 전</p>";
		} else if(diffDate != "0"){
			html += diffDate+"일 "+diffHours+"시간 "+diffMinutes+"분 전</p>";
		}
		html += "<p class='message-item-date'>"+data.loginTime+"</p>"
		+"</div>"
		+"</a>";
	return html;
}

$(document).ready(function(){
	getCharts(true);
	
	getTotalValues(true);
	
	getLoginMembers(false);
	
	repeatFunction = setInterval(function() {
		  getTotalValues(false);
		  updateLineChart();
		  updatePieChart();
		  getLoginMembers(true);
	}, 3000);
	
})

function updateLineChart(){
	getLineChartValues(true);
	let colums = ["비교", "어제", "오늘"];
	
//	console.log("AFTER>>");
//	console.log("yesterdaySales : "+ yesterdaySales);
//	console.log("todaySales : "+ todaySales);
	
	let test2Data = {
			labels: colums,
			datasets: [{
					label: '매출액',
					backgroundColor: '#3EB9DC',
					data: [target, yesterdaySales, todaySales] 
				}, 
				{
					label: '감소',
					backgroundColor: '#FF6363',
					data: [decrement]
				},
				{
					label: '증가',
					backgroundColor: '#C2E0FF',
					data: [increment]
				}]
		};
	
	lineChart.data.datasets[0].data = [target, yesterdaySales, todaySales];
	lineChart.data.datasets[1].data = [decrement];
	lineChart.data.datasets[2].data = [increment];
	lineChart.update();
}

function updatePieChart(){
	getPieChartValues(true);
	let pieData = [totalMember, totalLeaveMember];
	pieChart.data.datasets[0].data = pieData;
	pieChart.update();
}