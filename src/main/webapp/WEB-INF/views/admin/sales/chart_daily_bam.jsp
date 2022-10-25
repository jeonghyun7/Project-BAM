<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
<c:set var="sysMonth"><fmt:formatDate value="${now}" pattern="MM" /></c:set>
<c:set var="prevYear" value="${sysYear-1}"/> 
<c:set var="lastYear" value="${sysYear-2}"/> 
<c:set var="pastYear" value="${sysYear-3}"/> 
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"/>


<style>

	.grid-container {
	  display: grid;
	  grid-template-columns: 1fr 1fr;
	  grid-template-rows: 1fr;
	  gap: 1px 1px;
	  grid-template-areas: "right-chart left-table";
	  width:100% !important;
	  height:100% !important;
	}
	
	.right-chart { grid-area: right-chart; margin-left: 5px; }
	
	.left-table { grid-area: left-table;
				width: 900px;
       			padding-left: 5vh; 
	}
	th, td { white-space: nowrap; }

</style>
<div class="content-page">
	
		<!-- Start content -->
        <div class="content">
            
			<div class="container-fluid">

					<div class="row">
							<div class="col-xl-12">
									<div class="breadcrumb-holder">
											<h1 class="main-title float-left">사이트 일자별 매출</h1>
											<ol class="breadcrumb float-right">
												<li class="breadcrumb-item">Home</li>
												<li class="breadcrumb-item">매출 통계</li>
												<li class="breadcrumb-item active">사이트 일자별 매출</li>
											</ol>
											<div class="clearfix"></div>
									</div>
							</div>
					</div>
					<!-- end row -->

					
					<div class="grid-container" style="height:auto !important">
						<div class="right-chart">
							<div class="card mb-3">
									<div class="card-header">
										<i class="fa fa-table"></i> 사이트 일자별 매출
									</div>
										
									<div class="card-body" style="height:auto !important">
										<canvas id="myChart"></canvas>
									</div>							
									<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
							</div>
							<!-- end card-->				
						</div>
  						<div class="left-table">
  							<div class="m-table">						
								<div class="card mb-3">
									<div class="card-header">
										<h3><i class="fab fa-free-code-camp"></i> <span id="camp_name">불밤야밤</span></h3>
										#순 이익 : 영업 수수료 <br> #매출 수익률 : (순 이익/총 매출) X 100 
								
									</div>
									<div>
										<input id="camp_idx" type="hidden" value="">
										<input type="button" id="submit4chart" onclick="redrawChart()" value="조회하기" style="float:right; margin-right:10px;">
										<select id="month" style="float:right; margin-right:10px;">
													<c:forEach var="i" begin="1" end="12" step="1" >
														<option value="<fmt:formatNumber value="${i}" minIntegerDigits="2"/>" <c:if test="${i == now.month + 2}">selected</c:if> >${i}
														</option>														
													</c:forEach>
										</select>
										<select id="year" style="float:right; margin-right:10px;">
													<option value="<c:out value="${sysYear}"/>" selected>${sysYear}</option>
													<option value="<c:out value="${prevYear}"/>">${prevYear}</option>
													<option value="<c:out value="${lastYear}"/>">${lastYear}</option>
													<option value="<c:out value="${pastYear}"/>">${pastYear}</option>
										</select>
									</div>
										
									<div class="card-body">
										
										<table id="example1" class="table table-bordered table-responsive-xl table-hover display">
											<thead>
												<tr>
													<th>구분(일)</th>
													<th>총 매출액(원)</th>
													<th>거래 수(회)</th>
													<th>업체 순 이익(원)</th>
													<th>영업 수수료(원)</th>
													<th>매출 수익률(%)</th>
												</tr>
											</thead>													
											<tbody id="innerData">
												
											</tbody>
										</table>
										
									</div>														
								</div><!-- end card-->					
							</div>
  						</div>
									
					</div>
					<!-- end grid-container -->

            </div>
			<!-- END container-fluid -->

		</div>
		<!-- END content -->

    </div>
	<!-- END content-page -->


<!-- BEGIN Java Script for this page -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js" defer></script>

	
	
	<script>
	// lineChart
	let myData = {
			labels: [],
			datasets: [{ 
				label: '일별 매출 추이',
				data: [],
				backgroundColor: 'rgba(255, 99, 132, 0.2)',
				borderColor: 'rgba(255,99,132,1)',
				borderWidth: 1
			}]
		};
	
	let chart = document.getElementById('myChart');
	let myCtx = chart.getContext('2d');
	let lineChart = new Chart(myCtx, {
		type: 'line',
		data: myData,
		options: {
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero:true
					}
				}]
			}
		}
	});


	
	function redrawChart(){
		let camp_idx = document.querySelector("#camp_idx").value;
		let year = document.querySelector("#year").options[document.querySelector("#year").selectedIndex].value;
		let monthStr = document.querySelector("#month").options[document.querySelector("#month").selectedIndex].value.padStart(2,'0');
		
		const month = year + '-' + monthStr;
		
		const xhttp = new XMLHttpRequest(); // xmlHttpRequest생성
		
		xhttp.onreadystatechange = loader; //readystate에 변화가생기면 호출되는 함수
		xhttp.open('GET', './sales_data_bam_d.bam?month='+month, true);
		xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8'); //http헤더에 들어가는 것
		xhttp.send();
		
		
		//콜백함수
		function loader() {
			try {
				if(xhttp.readyState === XMLHttpRequest.DONE) {
					var status = xhttp.status;
					if(status === 200) {
						let result = xhttp.responseText;
						const jsonObj = JSON.parse(result);
						let tempStr = '';
						//배열 초기화
						myData.labels.length=0;
						myData.datasets[0].data.length=0;
						for(let i=0;i<jsonObj.length;i++){
							tempStr += '<tr>';
							tempStr += '<td>'+jsonObj[i].day+'</td>';
							tempStr += '<td>'+jsonObj[i].total_sale+'</td>';
							tempStr += '<td>'+jsonObj[i].count_sale+'</td>';
							tempStr += '<td>'+jsonObj[i].profit+'</td>';
							tempStr += '<td>'+jsonObj[i].earning+'</td>';
							tempStr += '<td>'+jsonObj[i].ros+'</td>';
							tempStr += '</tr>';
							myData.labels.push(jsonObj[i].day);
							myData.datasets[0].data.push(jsonObj[i].total_sale);
						}
						lineChart.update();
						document.querySelector("#innerData").innerHTML = tempStr;
					
					}else{
						alert("request에 문제가 발생했습니다.");
					}
					
				}
				
		}catch(exception) {
			alert("데이터가 존재하지 않습니다.");
		}

		}
		
	}
	
	window.onload = function(){
		
		let year = '${sysYear}';
		let monthStr = '${sysMonth}';
		
		const month = year + '-' + monthStr;
		
		const opt = document.querySelectorAll("#year option");
		for(let i=0;i<opt.length;i++){
			if(opt[i].value === year){
				opt[i].selected = 'selected';
				break;
			}
		}
		
		const opt2 = document.querySelectorAll("#month option");
		for(let i=0;i<opt2.length;i++){
			if(opt2[i].value === monthStr){
				opt2[i].selected = 'selected';
				break;
			}
		}

		const xhttp = new XMLHttpRequest(); // xmlHttpRequest생성
		
		xhttp.onreadystatechange = loader; //readystate에 변화가생기면 호출되는 함수
		xhttp.open('GET', './sales_data_bam_d.bam?month='+month, true);
		xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8'); //http헤더에 들어가는 것
		xhttp.send();
		
		
		//콜백함수
		function loader() {
			try {
				if(xhttp.readyState === XMLHttpRequest.DONE) {
					var status = xhttp.status;
					if(status === 200) {
						let result = xhttp.responseText;
						const jsonObj = JSON.parse(result);
						let tempStr = '';
						for(let i=0;i<jsonObj.length;i++){
							tempStr += '<tr>';
							tempStr += '<td>'+jsonObj[i].day+'</td>';
							tempStr += '<td>'+jsonObj[i].total_sale+'</td>';
							tempStr += '<td>'+jsonObj[i].count_sale+'</td>';
							tempStr += '<td>'+jsonObj[i].profit+'</td>';
							tempStr += '<td>'+jsonObj[i].earning+'</td>';
							tempStr += '<td>'+jsonObj[i].ros+'</td>';
							tempStr += '</tr>';
							myData.labels.push(jsonObj[i].day);
							myData.datasets[0].data.push(jsonObj[i].total_sale);
						}
						lineChart.update();
						document.querySelector("#innerData").innerHTML = tempStr;
					}else{
						alert("request에 문제가 발생했습니다.");
					}
					
				}
				
		}catch(exception) {
			alert("데이터가 존재하지 않습니다.");
		}

		}
			
		
		
	}
	
		
	</script>
<!-- END Java Script for this page -->


</html>