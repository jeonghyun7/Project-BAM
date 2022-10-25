<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <style>
    
    .card-image:after {
		background-color:transparent !important;
    }

	#bgvid {
            position: fixed; right: 0; bottom: 0;
            min-width: 100%; min-height: 100%;
            width: auto; height: auto; z-index: -100;
            background-size: cover;
    }
    
    #div1 {
    text-align:center;
    z-index: 1;
    color: white;
    }

  </style>



<!-- ================================
    START HERO-WRAPPER AREA
================================= -->

<section class="hero-wrapper hero-wrapper4">
    <div class="hero-overlay"></div><!-- end hero-overlay -->
    <div class="video-bg">
        <video id="bgvid" src="video/main_viedo.mov" autoplay="true" muted loop="true"></video>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="hero-heading">
                    <div class="section-heading">
                        <h2 class="sec__title">불타는밤? 야외의밤!</h2>
                        <p class="sec__desc" style="color:white">
                          	신나는 OutDoor Day! 불밤야밤과 함께하세요.
                        </p>
                    </div>
                </div><!-- end hero-heading -->
                <div class="main-search-input" onkeyup="enterkey();">
                    <div class="main-search-input-item">
                        <div class="contact-form-action">
                                <div class="main-search form-group mb-0" ng-app="app" ng-controller="appCtrl">
                                    <span class="la la-search form-icon"></span>
                                    <input id="search" class="form-control" type="text" placeholder="위치">
                                </div>
                        </div>
                    </div><!-- end main-search-input-item -->
                    
                    <!-- daterangepicker jquery 라이브러리사용해서 달력 띄움 -->
                    <!-- 밑에 js사용해서 값주고받음 -->
                    <div class="main-search-input-item">
                    <div class="contact-form-action padding-top-29px" style="margin-top: 17px">
                               <div class="form-group">
                                   <span class="la la-calendar-o form-icon"></span>
                                   <input id="initDate" class="date-range form-control"
										style="cursor: pointer; background-color:#ffffff" type="text" name="daterange"
										value="" readonly/>
                               </div>
                    </div><!-- end main-search-input-item -->
                    </div><!-- end main-search-input-item -->
                    <div class="main-search-input-item">
						<select class="custom-select" style="height: 50px;"  id="optionNo" name="optionNo" onchange='selectPeopleNum();'>
						  <option value="1" selected>1 명</option>
						  <option value="2">2 명</option>
						  <option value="3">3 명</option>
						  <option value="4">4 명</option>
						  <option value="5">5 명</option>
						  <option value="6">6 명</option>
						  <option value="7">7 명</option>
						  <option value="8">8 명</option>
						  <option value="9">9 명</option>
						  <option value="10">10 명</option>
						</select>
                    </div><!-- end main-search-input-item -->
                    <div class="main-search-input-btn">
                        <button class="button theme-btn" type="button" onclick="submitSearch()">검색</button>
                    </div><!-- end main-search-input-btn -->
                </div><!-- end main-search-input -->
            </div><!-- end col-lg-12 -->
        </div><!-- end row -->
        
		<!-- request 할 데이터 -->
        <form id="searched-data" action="search/search.bam" method="get">
        	<input type="hidden" id="searched-place" name="searchPlace" value="">
        	<input type="hidden" id="check-in" class="check-in" name="checkIn" value="">
        	<input type="hidden" id="check-out" class="check-out" name="checkOut" value="">
        	<input type="hidden" id="peopleNum" name="peopleNum" value="1">
        </form>                          
        
    </div><!-- end container -->
    <!-- <div class="hero-svg-content text-center">
        <i class="fa fa-angle-down"></i>
    </div> -->
</section><!-- end hero-wrapper -->
<!-- ================================
    END HERO-WRAPPER AREA
================================= -->

<!-- ================================
    START CARD AREA
================================= -->
<section class="card-area text-center padding-top-100px padding-bottom-100px">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-heading" id="div1">
                    <h2 id="div1" class="sec__title before-none pt-0">가장 많이 예약한 캠핑장</h2><br>
                    <p id="div1" class="sec__title before-none pt-2" style="color: white; text-align:center; z-index: 200; font-size: 25px; font-weight: lighter;">많은 밤캠퍼에게 사랑받은 캠핑장을 확인해보세요!</p>
                    <br/><div
					  class="fb-like"
					  data-share="true"
					  data-width="450"
					  data-show-faces="true"
					  >
					</div>
                </div><!-- end section-heading -->
            </div><!-- end col-lg-12 -->
        </div><!-- end row -->
        <div class="row">
        	<div class="col-lg-12">
                <div class="card-carousel mt-5">
                <c:forEach var="unit" items="${bestCamp}">
                    <div class="card-item">
                       <%--  <a href="camp/camp_detail.bam?camp_idx=${unit.camp_idx}" class="card-image-wrap"> --%>
                         <form onclick="clickCamp('${unit.camp_idx}','${unit.fname}')" class="card-image-wrap">
                            <div class="card-image">
                                <img src="/images/camp-img/thumb/${unit.fname}" class="card__img" alt="">
                                <span class="badge">운영중</span>
                                <span class="badge-toggle" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="${unit.countHeart}명이 찜했습니다.">
                                    <i class="la la-heart-o"></i>
                                </span>
                            </div>
                        </form>
                        <div class="card-content-wrap">
                            <div class="card-content">
                                <a href="camp/camp_detail.bam?camp_idx=${unit.camp_idx}">
                                    <h5 class="card-meta"><span class="la la-home"></span> 캠핑장</h5>
                                    <h4 class="card-title" style="color: white;">
                                       ${unit.camp_name} <i class="fa fa-check-circle" data-toggle="tooltip" data-placement="top" title="" data-original-title="Claimed"></i>
                                    </h4>
                                    <p class="card-sub" style="color: white;">${unit.address}</p>
                                </a>
                                
                                <ul class="info-list padding-top-20px">
                                    <li style="color: white;"><span class="la la-phone"></span>${unit.camp_tel}</li>
                                    <li>
                                        
                                    </li>
                                    <li style="color: white;"><span class="la la-calendar-check-o"></span>
                                        ${unit.intro}
                                    </li>
                                </ul>
                            </div>
                            <div class="rating-row" style="color: white;">
                                <div class="rating-rating">
                                    <c:forEach begin="1" end="${unit.fullStarNum}" step="1">
									<span class="la la-star"></span>
								</c:forEach>
								<c:if test="${unit.halfStarExist}">
									<span class="la la-star-half-full"></span>
								</c:if>
	                            <c:forEach begin="1" end="${unit.emptyStarNum}" step="1">
									<span class="la la-star last-star"></span>
								</c:forEach>
	                             <span class="rating-count" style="color: orange;">${unit.avgStar}</span>
                                </div>
                                <div class="listing-info">
                                    <ul>
                                        <li><span class="la la-eye info__count"></span> 247</li>
                                    </ul>
                                </div>
                            </div>
                        </div><!-- end card-content-wrap -->
                    </div><!-- end card-item -->
               		</c:forEach>       
                </div><!-- end card-carousel -->
            </div><!-- end col-lg-12 -->    
        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end card-area -->
<!-- ================================
    END CARD AREA
================================= -->


<div class="section-block"></div>

<!-- ================================
       START BLOG AREA
================================= -->
<section class="blog-area padding-top-100px before-none after-none padding-bottom-80px">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-heading text-center">
                    <h2 class="sec__title before-none pt-0" style="color: white;">최근 게시물</h2>
                    <p class="sec__desc">
                        <span style="color: white;">불밤야밤의 소식을 인스타그램에서도 만나보세요!</span>
                    </p>
                </div><!-- end section-heading -->
            </div><!-- end col-lg-12 -->
        </div><!-- end row -->
        <div class="row mt-5">
            <div class="col-lg-4 column-td-6">
                <div class="card-item blog-card">
                    <a href="blog-single.html" class="card-image-wrap instaLink0">
                        <div class="card-image">
                            <img src="images/img31.jpg" alt="blog image" class="card__img insta0">
                        </div><!-- end card-image -->
                    </a>
                    <div class="card-content pl-0 pr-0">
                        <ul class="card-meta pl-0 d-flex justify-content-between align-items-center mt-2">
                            <li class="instaTime0" style="color: white; font-size: 16px">04 Oct, 2022</li>
                            <li></li>
                        </ul>
                        <p class="card-sub mt-3 instaContent0" style="color: white;">
                            Sed ut perspiciatis unde omnis iste natus error sit
                            voluptatem eaque ipsa quae ab illo inventore
                            incididunt ut labore et dolore magna
                        </p>
                    </div><!-- end blog-post-body -->
                </div><!-- end card-item -->
            </div><!-- end col-lg-4 -->
            
            <div class="col-lg-4 column-td-6">
                <div class="card-item blog-card">
                    <a href="blog-single.html" class="card-image-wrap instaLink1">
                        <div class="card-image">
                            <img src="images/img31.jpg" alt="blog image" class="card__img insta1">
                        </div><!-- end card-image -->
                    </a>
                    <div class="card-content pl-0 pr-0">
                        <ul class="card-meta pl-0 d-flex justify-content-between align-items-center mt-2">
                            <li class="instaTime1" style="color: white; font-size: 16px">04 Oct, 2022</li>
                            <li></li>
                        </ul>
                        <p class="card-sub mt-3 instaContent1" style="color: white;">
                            Sed ut perspiciatis unde omnis iste natus error sit
                            voluptatem eaque ipsa quae ab illo inventore
                            incididunt ut labore et dolore magna
                        </p>
                    </div><!-- end blog-post-body -->
                </div><!-- end card-item -->
            </div><!-- end col-lg-4 -->
            
            <div class="col-lg-4 column-td-6">
                <div class="card-item blog-card">
                    <a href="blog-single.html" class="card-image-wrap instaLink2">
                        <div class="card-image">
                            <img class="card__img insta2" src="images/img31.jpg" alt="blog image" >
                        </div><!-- end card-image -->
                    </a>
                    <div class="card-content pl-0 pr-0">
                        <ul class="card-meta pl-0 d-flex justify-content-between align-items-center mt-2">
                            <li class="instaTime2" style="color: white; font-size: 16px">04 Oct, 2022</li>
                            <li></li>
                        </ul>
                        <p class="card-sub mt-3 instaContent2" style="color: white;">
                            Sed ut perspiciatis unde omnis iste natus error sit
                            voluptatem eaque ipsa quae ab illo inventore
                            incididunt ut labore et dolore magna
                        </p>

                    </div><!-- end blog-post-body -->
                </div><!-- end card-item -->
            </div><!-- end col-lg-4 -->
            
            <div class="col-lg-4 column-td-6">
                <div class="card-item blog-card">
                    <a href="blog-single.html" class="card-image-wrap instaLink3">
                        <div class="card-image">
                            <img class="card__img insta3" src="images/img31.jpg" alt="blog image">
                        </div><!-- end card-image -->
                    </a>
                    <div class="card-content pl-0 pr-0">
                        <ul class="card-meta pl-0 d-flex justify-content-between align-items-center mt-2">
                            <li class="instaTime3" style="color: white; font-size: 16px">04 Oct, 2022</li>
                            <li></li>
                        </ul>
                        <p class="card-sub mt-3 instaContent3" style="color: white;">
                            Sed ut perspiciatis unde omnis iste natus error sit
                            voluptatem eaque ipsa quae ab illo inventore
                            incididunt ut labore et dolore magna
                        </p>

                    </div><!-- end blog-post-body -->
                </div><!-- end card-item -->
            </div><!-- end col-lg-4 -->
            
            <div class="col-lg-4 column-td-6">
                <div class="card-item blog-card">
                    <a href="blog-single.html" class="card-image-wrap instaLink4">
                        <div class="card-image">
                            <img class="card__img insta4" src="images/img31.jpg" alt="blog image">
                        </div><!-- end card-image -->
                    </a>
                    <div class="card-content pl-0 pr-0">
                        <ul class="card-meta pl-0 d-flex justify-content-between align-items-center mt-2">
                            <li class="instaTime4" style="color: white; font-size: 16px">04 Oct, 2022</li>
                            <li></li>
                        </ul>
                        <p class="card-sub mt-3 instaContent4" style="color: white;">
                            Sed ut perspiciatis unde omnis iste natus error sit
                            voluptatem eaque ipsa quae ab illo inventore
                            incididunt ut labore et dolore magna
                        </p>

                    </div><!-- end blog-post-body -->
                </div><!-- end card-item -->
            </div><!-- end col-lg-4 -->
            
            <div class="col-lg-4 column-td-6">
                <div class="card-item blog-card">
                    <a href="blog-single.html" class="card-image-wrap instaLink5">
                        <div class="card-image">
                            <img class="card__img insta5" src="images/img31.jpg" alt="blog image">
                        </div><!-- end card-image -->
                    </a>
                    <div class="card-content pl-0 pr-0">
                        <ul class="card-meta pl-0 d-flex justify-content-between align-items-center mt-2">
                            <li class="instaTime5" style="color: white; font-size: 16px">04 Oct, 2022</li>
                            <li></li>
                        </ul>
                        <p class="card-sub mt-3 instaContent5" style="color: white;">
                            Sed ut perspiciatis unde omnis iste natus error sit
                            voluptatem eaque ipsa quae ab illo inventore
                            incididunt ut labore et dolore magna
                        </p>

                    </div><!-- end blog-post-body -->
                </div><!-- end card-item -->
            </div><!-- end col-lg-4 -->
        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end blog-area -->
<!-- ================================
       START BLOG AREA
================================= -->

<div class="section-block"></div>

<!-- ================================
       START CLIENTLOGO AREA
================================= -->
<section class="clientlogo-area padding-top-80px padding-bottom-80px">
		<div class="container">	
				<div class="row">
		            <div class="col-lg-12">
		                <div class="section-heading text-center">
		                    <p id="div1" class="sec__title before-none pt-0">협력사</p>
		                    <br>
		                   <!--  <p class="sec__desc"> -->
		                    <p id="div1" class="sec__title before-none pt-2" style="color: white; text-align:center; z-index: 200; font-size: 25px; font-weight: lighter;" >
		                        불밤야밤과 함께합니다.
		                        </p>
		                </div><!-- end section-heading -->
		            </div><!-- end col-lg-12 -->
		        </div><!-- end row -->
		   </div>
    <div class="container">
        <div class="row">
        	<div class="col-lg-12" style="padding-top:80px;">
                <div class="client-logo text-center">
                    <div class="client-logo-item">
                        <img style="height:150px !important" src="/images/index-logo/1.jpg" alt="brand image">
                    </div><!-- end client-logo-item -->
                    <div class="client-logo-item">
                        <img style="height:150px !important" src="/images/index-logo/2.jpg" alt="brand image">
                    </div><!-- end client-logo-item -->
                    <div class="client-logo-item">
                        <img style="height:150px !important" src="/images/index-logo/3.jpg" alt="brand image">
                    </div><!-- end client-logo-item -->
                    <div class="client-logo-item">
                        <img style="height:150px !important" src="/images/index-logo/4.jpg" alt="brand image">
                    </div><!-- end client-logo-item -->
                    <div class="client-logo-item">
                        <img style="height:150px !important" src="/images/index-logo/5.jpg" alt="brand image">
                    </div><!-- end client-logo-item -->
                    <div class="client-logo-item">
                        <img style="height:150px !important" src="/images/index-logo/6.jpg" alt="brand image">
                    </div><!-- end client-logo-item -->
                </div><!-- end client-logo -->
            </div><!-- end col-lg-12 -->
        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end clientlogo-area -->
<!-- ================================
       START CLIENTLOGO AREA
================================= -->




<!-- ================================
       START INSTAGRAM AREA
================================= -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/js/insta.js"></script>
<script src="/js/search.js"></script>

<script>
window.onload = function(){
    var now = new Date();
    var nowYear = now.getFullYear();
    var nowMonth = now.getMonth() + 1;
    var nowDate = now.getDate();
    var dayOfTheWeek = now.getDay();

    if (nowMonth < 10) {
        nowMonth = "0" + nowMonth;
    }
    
    if (nowDate < 10) {
        nowDate = "0" + nowDate;
    }
    
    currentDate = nowYear + "/" + nowMonth + "/" + nowDate;
    
    let last_date = new Date(nowYear, nowMonth, 0);
    let tomorrow = (now.getDate()+1);
    let nextMonth = nowMonth;
    let nextYear = nowYear;
    if(tomorrow > last_date){
    	nextMonth = now.getMonth() + 2;
    }
    if(nextMonth > 12){
    	nextMonth = "01";
    	nextYear = now.getFullYear()+1;
    }
    
    if (nextMonth < 10) {
    	nextMonth = "0" + nextMonth;
    }
    
    if (tomorrow < 10) {
    	tomorrow = "0" + tomorrow;
    }
    
    nextDate = nextYear + "/" + nextMonth + "/" + tomorrow;
    
    
    $('#check-in').val(currentDate);
    $('#check-out').val(nextDate);
    let date = currentDate+" - "+nextDate;
	 document.getElementById('initDate').value = date;
	 
     $('input[name="daterange"]').daterangepicker({
     	autoApply: true,
     	minDate: new Date(),
     	opens: 'center',
     	//applyLabel: '확인',
     	//cancelLabel: '취소',
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
     	$('.check-in').val(start.format('YYYY/MM/DD'))
     	$('.check-out').val(end.format('YYYY/MM/DD'))
     });
}

function clickCamp(camp_idx, thumb){
	localStorage.setItem('thumb', thumb);
	location.href="../camp/camp_detail.bam?camp_idx="+camp_idx;
}
</script>
