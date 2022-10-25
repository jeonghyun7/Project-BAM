<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<style>
.select-pointer {
	cursor: pointer
}

 .no-review-content {
  display: -webkit-flex;
  display: -ms-flexbox;
  display: grid; } 

#weatherTable {
	text-align: center;
	font-size: 12px;
	color: #646464;
	width: 350px;
}

.borderbar {
	border-right: 1px solid #cecece;
}

.divisionBorderbar {
	border-color: black;
	border-right: 4px solid #cecece;
}

.test-star span {
	color: #f9b851;
	margin-left: -4px;
	display: inline-block;
	font-size: 14px;
}

.test-star span .rating-count {
	margin-left: 0;
	color: #808996;
	font-weight: 500;
	font-size: 13px;
}

.test-star span .last-star {
	color: #808996;
}

.max {
	display: inline;
	padding-left: 5px;
	color: red;
	font-weight: bold;
	font-size: 12px;
}

.min {
	display: inline;
	padding-left: 5px;
	color: blue;
	font-weight: bold;
	font-size: 12px;
}

.date {
	font-size: 18px;
	font-weight: bold;
}
</style>

<!-- ================================
    START BREADCRUMB AREA
================================= -->
<section class="breadcrumb-area listing-detail-breadcrumb">
	<div class="breadcrumb-wrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 position-relative">
					<div class="breadcrumb-content" style="background-color:rgba(0, 30, 56, 0.7); border-radius:50px; padding-left:45px; padding-right:45px;padding-top:15px; padding-bottom:10px; box-shadow:0 0 10px 5px rgba(0, 0, 0, 0.5);">
						<input type="hidden" name="campName" id="campName" value="${camp.camp_name}">
						<input type="hidden" name="address" id="address" value="${camp.address}">
						<input type="hidden" name="camp_idx" id="camp_idx" value="1">
						<input type="hidden" name="bbqPrice" id="bbqPrice" value="${camp.bbq_fee}">
						<input type="hidden" id="campIdx" value="${camp.camp_idx}">
						<input type="hidden" id="nextPage" value="${page.nextPage}">
						<input type="hidden" id="pageCount" value="${page.pageCount}">
						
						<!-- member session에 대한 숨김 영역(for 찜)-->
						<input type="hidden" id="initMember" value="${member.email}">
						
						<h2 class="breadcrumb__title">${camp.camp_name}</h2>
						<p class="breadcrumb__desc">
							<span class="la la-map-marker"></span> ${camp.address}	
						</p>
						<ul class="listing-info mt-3 mb-3">
							<li><button type="button" class="theme-btn border-0" id="emptyHeart-${camp.camp_idx}" onclick="fillHeart(this)">
									<i class="la la-heart-o"></i> 찜
								</button>
								<button type="button" style="display:none" class="theme-btn border-0" id="heart-${camp.camp_idx}" onclick="emptyHeart(this)">
										<i class="la la-heart"></i> 찜
								</button>
							<li>
								<div class="average-ratings">
									<span class="theme-btn button-success">
									
										<i class="la la-star"></i>
										<c:if test="${empty reviewVo}">0.0</c:if>
										${reviewVo.avgStar}
										<input type="hidden" id="avgStar" value="${reviewVo.avgStar}">
									</span> <span><strong>
									<c:if test="${empty reviewVo}">0</c:if>
									${page.listCount}</strong> Reviews</span>
								</div>
							</li>
						</ul>

					</div>
					<!-- end breadcrumb-content -->
					<div class="report-list-items">
						<ul class="listing-info">
							<li></li>
						</ul>
					</div>
					<!-- end report-list-items -->
				</div>
				<!-- end col-lg-12 -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</div>
	<!-- end breadcrumb-wrap -->
	
	<!-- end bread-svg -->
</section>
<!-- end breadcrumb-area -->
<!-- ================================
    END BREADCRUMB AREA
================================= -->

<!-- ================================
    START SINGLE LISTING AREA
================================= -->
<section class="single-listing-area padding-top-35px">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="single-listing-wrap">
					<h2 class="widget-title">갤러리</h2>
					<div class="title-shape"></div>
					<div class="gallery-carousel padding-top-35px padding-bottom-40px">
						<c:forEach items="${ImgDetailList}" var="campDetailImg">
							<div data-dot="<img src='/images/camp-img/detail/${campDetailImg.fname}'>"class="gallery-item">
								<img src="/images/camp-img/detail/${campDetailImg.fname}" alt="gallery-image">
							</div>
							<!-- end gallery-item -->
						</c:forEach>
						
					</div>
					<!-- end gallery-carousel -->
					<div class="listing-description padding-bottom-35px">
						<h2 class="widget-title">캠핑장 소개</h2>
						<div class="title-shape"></div>
						<div class="section-heading mt-4">
							<c:if test="${empty camp.intro}">
							<p class="sec__desc font-size-16">사업자가 등록한 소개글이 없습니다.</p>
							</c:if>
							<p class="sec__desc font-size-16">${camp.intro}</p>
						</div>
					</div>
					<!-- end 캠핑장 소개 -->

					<div class="feature-listing padding-bottom-20px">
						<h2 class="widget-title">캠핑 사이트</h2>
						<div class="title-shape"></div>

						<!-- 카테고리 -->
						<c:forEach var="sortList" items="${sortNameList}" varStatus="status">
							<!-- 카라반, 글램핑 -->
							<br />
							<p class=“font-weight-medium” style="font-size: 1.5em">
								<img
									src="data:image/png;base64,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">
								&nbsp;${sortList}

							</p>
							<br />
							<!-- end 카테고리 -->

							<c:forEach items="${list}" varStatus="i">
								<c:forEach items="${list[i.index]}" var="sort">
									<c:if test="${sortList eq sort.sort_name}">
										<c:set var="j" value="${j+1}" />
										<div class="card mb-3 select-pointer" onclick="selectSite(${j})">
											<input type="hidden" id="category${j}" value="${sort.sort_name}" />
											<div class="row no-gutters">
												<div class="col-md-4">
													<img id="img${j}" src="/images/camp-img/sort/${sort.fname}"
														height=200 width=540 class="card-img">
												</div>
												<div class="col-md-8">
													<div class="card-body">
														<h5 id="campZone${j}" class="card-title">
															${sort.site_name}</h5>
														<p class="card-text">
															인원 제한 수 : <strong id="maxPeople${j}">
																${sort.people_num}</strong> <br /> 가격 : <strong id="price${j}"
																class="price">${sort.site_fee}</strong>
																<input id="sort_idx${j}" type="hidden" value="${sort.sort_idx}">
														</p>
													</div>
												</div>
											</div>
										</div>
										<!-- end 카드 -->
									</c:if>
								</c:forEach>
								<!-- end sort -->
							</c:forEach>
						</c:forEach>
						
					</div>
					<!-- end 캠핑 사이트 -->

					<div class="feature-listing padding-bottom-20px">
						<h2 class="widget-title">시설 이용</h2>
						<div class="title-shape"></div>
						<ul class="list-items mt-4">
							<c:forEach items="${allConvList}" var="conv">
								<li><i class="la la-check-circle-o color-text font-size-18"></i>
									${conv}</li>
							</c:forEach>
						</ul>
					</div>
					<!-- end 시설 이용 -->

<!-- ================================
    START KakaoMap AREA
================================= -->
					<div class="listing-map gmaps">
						<h2 class="widget-title">캠핑장 위치</h2>
						<div class="title-shape margin-bottom-35px"></div>
						<div id="map">

							<script type="text/javascript"
								src="//dapi.kakao.com/v2/maps/sdk.js?appkey=[카카오앱키입력]&libraries=services"></script>

						</div>
					</div>
					<!-- end 캠핑장 위치 -->
					<br />
<!-- ================================
   	END KakaoMap AREA
================================= -->

<!-- ================================
    START Weather AREA
================================= -->
					<h2 class="widget-title">날씨</h2>
					<div class="title-shape margin-bottom-35px"></div>
					<!-- weather widget start -->
					<table id="weatherTable">
						<tr align="center">
							<th colspan="4" class="divisionBorderbar">
								<div id="date0"	class="date" style="margin-bottom: 10px"></div>
							</th>
							<th colspan="4">
								<div id="date4" class="date" style="margin-bottom: 10px"></div>
							</th>
						</tr>
						
						<tr>
						<c:forEach begin="0" end="7" step="1" varStatus="i">
						<c:choose>
							<c:when test="${i.index eq 3}">
								<td class="divisionBorderbar">
							</c:when>
							<c:otherwise>
								<td class="borderbar">
							</c:otherwise>
						</c:choose>
								<div id="hour${i.index}">시</div>
								<div id="cicon${i.index}" class="cicon"></div>
								<div>
									기온
									<div id="ctemp${i.index}" class="max chightemp">℃</div>
								</div>
								<div>
									강수 확률
									<div id="pop${i.index}" class="min pop">%</div>
								</div>
							</td>
						</c:forEach>
						</tr>
					</table>
<!-- ================================
   	END Weather AREA
================================= -->

					<div class="contact-listing padding-top-40px padding-bottom-40px">
						<h2 class="widget-title">캠핑장 정보</h2>
						<div class="title-shape"></div>
						<div class="info-list margin-top-35px padding-bottom-35px">
							<ul>
								<li class="mb-2"><span><i class="la la-map-marker"></i>
										주소:</span>${camp.address}</li>
								<li class="mb-2"><span><i class="la la-phone"></i>
										전화번호:</span><a href="#">${camp.camp_tel}</a></li>
							</ul>
						</div>
						<div class="section-block"></div>
					</div>
					<!-- end 캠핑장 정보 -->

					<div class="review-content-wrap">
						<h2 class="widget-title">리뷰</h2>
						<div class="title-shape"></div>
						<c:if test="${!empty reviewVo}">
						<div class="review-content padding-top-45px padding-bottom-50px">
							<div class="review-rating-summary" style="margin-top: 40px;">
								<div class="review-rating-summary-inner">
									<div class="stats-average__count">
										<span class="stats-average__count-count">${reviewVo.avgStar}</span>
									</div>
									<!-- end stats-average__count -->
									<div class="stats-average__rating">
										<div class="rating-rating d-flex">

											<c:forEach begin="1" end="${reviewVo.fullStarNum}">
												<span class="la la-star"></span>
											</c:forEach>
											<c:if test="${reviewVo.halfStarExist}">
												<span class="la la-star-half-full"></span>
											</c:if>
											<c:forEach begin="1" end="${reviewVo.emptyStarNum}" step="1">
												<span class="la la-star last-star"></span>
											</c:forEach>

										</div>
										<p class="stats-average__rating-rating">
											(${reviewVo.avgStar})</p>
									</div>
									<!-- end stats-average__rating -->
								</div>
								<!-- end review-rating-summary-inner -->
								<div class="course-rating-text">
									<p class="course-rating-text__text">캠핑장 별점</p>
								</div>
								<!-- end course-rating-text -->
							</div>
							<!-- end review-rating-summary -->
							<div class="review-rating-widget">
							<div id="barchart"></div>
							</div>
							<!-- end review-rating-widget -->
						</div>
						</c:if>
						<c:if test="${empty reviewVo}">
						<div class="no-review-content padding-top-45px padding-bottom-30px">
							
								<span class="la la-weixin" style="margin-left:340px;font-size:60px;margin-bottom:10px;opacity:0.7"></span>
								<span style="margin-left:260px;font-size:18px;margin-bottom:50px"> 작성된 리뷰가 아직 없습니다.</span>
						</div>
						<div class="section-block"></div>
						</c:if>
						
						<!-- end review-content -->
					</div>
					<!-- end review-content-wrap -->
					<c:if test="${reviewVo ne null}">
					<div class="comments-wrap">
						<h2 class="widget-title">리뷰 댓글 (${page.listCount})</h2>
						<div class="title-shape"></div>
						<ul class="comments-list padding-top-40px">
							<li>
								<!-- //////////리뷰///////////// -->
								<div class="reviewList">
									<c:forEach items="${reviewVo.reviewList}" var="reviewList">
										<div class="comment">
											<div class="comment-body">
												<div class="meta-data test-star">
													<span class="comment__author ">${reviewList.nickname}
														<c:forEach begin="1" end="${reviewList.fullStarNum}">
															<span class="la la-star"></span>
														</c:forEach> <c:if test="${reviewList.halfStarExist}">
															<span class="la la-star-half-full"></span>
														</c:if> <c:forEach begin="1" end="${reviewList.emptyStarNum}"
															step="1">
															<span class="la la-star last-star" style="color: #808996"></span>
														</c:forEach>
													</span>
													<c:choose>
														<c:when test="${reviewList.diffDays==0}">
															<span style="color: #808996" class="comment__date">${reviewList.wdate}</span>
															<span class="comment__date">오늘</span>
														</c:when>
														<c:otherwise>
															<span style="color: #808996" class="comment__date">${reviewList.wdate}</span>
															<span class="comment__date">${reviewList.diffDays}일
																전 </span>
														</c:otherwise>
													</c:choose>
												</div>
												<p class="comment-content">${reviewList.content}</p>
											</div>
										</div>
										<!-- end 리뷰댓글 -->
									</c:forEach>
								</div>
							</li>
						</ul>
						<div class="section-block"></div>
						<div class="button-shared padding-top-40px text-center">
							<button id="loadMore" type="button" class="theme-btn border-0">
								<span class="la la-refresh"></span> 더보기
							</button>
						</div>
						<!-- end button-shared -->
					</div>
					</c:if>
					<!-- end comments-wrap -->
				</div>
				<!-- end single-listing-wrap -->
			</div>
			<!-- end col-lg-8 -->


			<div class="col-lg-4">
				<div class="sidebar section-bg">
					<div class="sidebar-widget">
						<div class="author-bio margin-bottom-30px">
							<div class="d-flex align-items-center">
								<!--  <img src="/images/testi-img2.jpg" alt="author-image"> -->
								<div class="author-inner-bio">
									<h4 id="focusHere"
										class="author__title font-weight-bold pb-0 mb-1">${camp.camp_name}</h4>
								</div>
							</div>
						</div>
						<div class="info-list">
							<ul>
								<li class="mb-2"><span><i class="la la-map-marker"></i>
										주소</span></li>
								<li class="mb-2" style="margin-left: 5px">${camp.address}</li>
								<li class="mb-2"><span><i class="la la-phone"></i>
										전화번호</span></li>
								<li class="mb-2" style="margin-left: 5px">${camp.camp_tel}</li>
							</ul>
							</ul>
						</div>
						<div class="section-block-2 margin-top-35px margin-bottom-35px"></div>
					</div>
					<!-- end sidebar-widget -->
					<div class="sidebar-widget date-widget">
						<h3 id="bookingBox" class="widget-title">예약</h3>
						<div class="title-shape"></div>
						<!-- start 선택된 캠핑 띄우기 -->
						<div class="similar-list padding-top-30px">
							<div class="recent-item mb-3">
								<div id="selectedImg" class="recent-img"></div>
								<!-- end recent-img -->
								<div id="selectedBody" class="recentpost-body">
									<h4 class='recent__link'></h4>
									<p class='recent__meta'>
										<span class='color-text font-weight-bold'>선택된 캠핑장이
											없습니다.</span>
									</p>
								</div>
								<!-- end recent-img -->
							</div>
							<!-- end recent-item -->
							<div
								class="check-box-list show-more-item mt-4 mb-4 customize-checkbox">
							</div>
						</div>
						<!-- end 선택된 캠핑 띄우기 -->
						<div class="contact-form-action padding-top-35px">
							<form>
								<div class="form-group">
									<span class="la la-calendar-o form-icon"></span> <input
										id="checkDate" class="date-range form-control"
										style="cursor: pointer" type="text"
										value="${checkIn} - ${checkOut}" readonly />
										<input type="hidden" id="checkIn" value="${checkIn}">
										<input type="hidden" id="checkOut" value="${checkOut}">
								</div>
							</form>
						</div>
						<div
							class="booking-content d-flex align-items-center justify-content-between text-center">
							<div class="input-number-group">
								<p>People</p>
								<div class="input-group-button check-available">
									<span class="input-number-decrement">-</span>
								</div>
								<input id="peopleNum" class="input-number peopleNum"
									type="number" value="${peopleNum}" min="0" max="0" readonly="readonly" >
								<div class="input-group-button check-available">
									<span class="input-number-increment">+</span>
								</div>
							</div>
							<!-- end input-number-group -->
						</div>
						<!-- end booking-content -->
						<div class="btn-box text-center padding-top-35px">
							<div id="booking-event" class="theme-btn d-block" onclick="setSessionAndSubmit()">캠핑장을 선택해주세요</div>
						</div>
						<!-- end btn-box -->
					</div>
					<!-- end sidebar-widget -->
				</div>
				<!-- end sidebar -->
			</div>
			<!-- end col-lg-4 -->
		</div>
		<!-- end row -->
	</div>
	<!-- end container -->
</section>
<!-- end single-listing-area -->
<!-- ================================
    END SINGLE LISTING  AREA
================================= -->

<!-- ================================
    START Tourist AREA
================================= -->
<section class="card-area padding-top-45px padding-bottom-100px">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-heading">
					<h2 class="widget-title">주변 축제/박람회</h2>
					<div class="title-shape"></div>
				</div>
				<!-- end section-heading -->
			</div>
			<!-- end col-lg-8 -->
		</div>
		<!-- end row -->
		<div class="row padding-top-40px">
 			<div id="tour" class="col-lg-12">
				<!-- end card-carousel -->
			</div>
			<!-- end col-lg-12 -->
		</div>
		<!-- end row -->
	</div>
	<!-- end container -->
</section>
<!-- ================================
    END Tourist AREA
================================= -->

<c:forEach begin="0" end="${chart.size()}" varStatus="i" step="1">
	<input type=hidden id="item${i.index}"value='${chart[i.index].item}' >
</c:forEach>


<!-- ================================
    JAVASCRIPT
================================= -->
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script>

let item =[];
let number =[];
let chart = [];

<c:forEach items="${chart}" var="chart">
item.push("${chart.item}");
number.push("${chart.number}");
</c:forEach> 

	chart.push(item);
	chart.push(number);
	
$(document).ready(function(){
	google.charts.load('current', {'packages':['corechart']}); //api 로딩
    google.charts.setOnLoadCallback(drawChart); //콜백 메소드 등록
    function drawChart(){
    	let dataChart = [['캠핑장 리뷰','비율(%)']];
    	 if(${chart.size()} != 0){
    		for(i=0; i<1  ; i++){
    			for(j=4; j>=0; j--){
    				dataChart.push([chart[i][j],Number(chart[i+1][j])]);
    			}
    		}
    	}else{
    		dataChart.push(['서버에서 넘어온 데이터가 없어요',1]);
    	}
    	let data = google.visualization.arrayToDataTable(dataChart);//배열을 dataTable형태로 바꿔주는 메소드
    	let view = new google.visualization.DataView(data);//테이블형태인 data를 view로 만들어주는 메소드
    	let option = {
    		colors: ['#f9b851'],
    		title : "별점",
    		width : 500,
    		height : 200,
    		hAxis: {
    	          maxValue: 100,
    	          gridlines: { count: 0 }
    	 	},
    	 	legend: {position: 'bottom'},
    		 chartArea:{
    			 width: '70%'
    		},
    	};
    	let chart3 = new google.visualization.BarChart(document.getElementById('barchart'));
    	chart3.draw(view, option);
    }
})
</script>

<script src="/js/custom-tourist.js"></script>
<script src="/js/kakao-map.js"></script>
<script src="/js/select-site.js"></script>
<script src="/js/camp-detail.js"></script>
<!-- for heart JS -->
<script src="/js/heart.js"></script>
<script src="/js/comma-format.js"></script>


<script>
 function check_dates(isAsync){
	let isAvailable = false;
	let sendData = {
		checkIn: document.getElementById('checkIn').value,
		checkOut: document.getElementById('checkOut').value,
		camp_idx : document.getElementById('campIdx').value
	};
	$.ajax({
		url: "check_dates.json",
		type: "POST",
		async: isAsync,
		data : JSON.stringify(sendData),
		contentType: "application/json",
		dataType: "JSON",
		success: function(responseData){
			if(responseData.dateList != null){
				let msg = "";
				for(let index in responseData.dateList){
					msg += responseData.dateList[index]+" ";
				}
				alert("현재 "+msg+"날짜는 예약이 불가능합니다.");
			}
			console.log("result : "+responseData.check);
			isAvailable = responseData.check;
			check_booking_available = isAvailable;
		}
	});
	return isAvailable;
}

var check_booking_available = check_dates(false);

var bbq_fee = ${camp.bbq_fee};
$(document).ready(function(){
	let check_in = $('#checkIn').val();
	let check_out = $('#checkOut').val();
        $('#checkDate').daterangepicker({
        	autoApply: true,
        	minDate: check_in,
        	opens: 'center',
        	 locale :{
                 format: 'YYYY/MM/DD',
                 'monthNames': [
                	 '1월',
                	 '2월',
                	 '3월',
                	 '4월',
                	 '5월',
                	 '6월',
                	 '7월',
                	 '8월',
                	 '9월',
                	 '10월',
                	 '11월',
                	 '12월'
                 ],
                 'daysOfWeek': [
                	 '일',
                	 '월',
                	 '화',
                	 '수',
                	 '목',
                	 '금',
                	 '토'
                 ]
             },
        }, function(start, end, label){
        	$('#checkIn').val(start.format('YYYY/MM/DD'));
        	$('#checkOut').val(end.format('YYYY/MM/DD'));
        	check_dates(true);
        });
})
</script>
