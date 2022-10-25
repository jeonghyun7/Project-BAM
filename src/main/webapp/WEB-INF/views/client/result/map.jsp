<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>불밤야밤 :: 최고의 캠핑 사이트</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="author" content="TechyDevs(made by DLI, OSJ, LJH, YHS)">
    <meta name="description" content="불밤야밤 -- We provides camping reservation and We also offer camping information and community">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge, chrome=1">
	
    <!-- Favicon -->
    <link rel="icon" href="/images/asdad.png" type="image/x-icon">
	
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:100,200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Mukta:200,300,400,500,600,700&display=swap" rel="stylesheet">

    <!-- Template CSS Files -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/font-awesome.css">
    <link rel="stylesheet" href="/css/line-awesome.css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/css/magnific-popup.css">
    <link rel="stylesheet" href="/css/animated-headline.css">
    <link rel="stylesheet" href="/css/daterangepicker.css">
    <link rel="stylesheet" href="/css/jquery-ui.css">
    <link rel="stylesheet" href="/css/jquery.filer.css">
    <link rel="stylesheet" href="css/jquery.filer-dragdropbox-theme.css">
    <link rel="stylesheet" href="/css/select2.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/searchResult.css">
    <script src="/js/modernizr.js"></script> <!-- Modernizr -->
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><!--jquery-->

</head>

<body>

<!-- start per-loader -->
<div class="loader-container">
    <div class="loader-ripple">
        <div></div>
        <div></div>
    </div>
</div>
<!-- end per-loader -->

<!-- member session에 대한 숨김 영역(for 찜)-->
<input type="hidden" id="initMember" value="${member.email}">
<section id="body">
	<div class="grid-container">
	
	  <div class="header">
    	<div class="logo"> <a href="../"><img src="/images/asdad.png" alt="logo"></a></div>
		<div class="searchbar">
			
                <div class="main-search-input" style="display:ruby-base !important; background-color:transparent !important;"  onkeyup="enterkey();">
                    <div class="main-search-input-item">
                        <div class="contact-form-action">
                                <div class="main-search form-group mb-0">
                                    <span class="la la-search form-icon"></span>
                                    <input id="search" class="form-control" type="text" placeholder="위치" value="${searchPlace}">
                                </div>
                        </div>
                    </div><!-- end main-search-input-item -->
                    <div class="main-search-input-item">
                    <div class="contact-form-action padding-top-29px" style="margin-top: 17px">
                               <div class="form-group">
                                   <span class="la la-calendar-o form-icon"></span>
                                   <input id="initDate" class="date-range form-control" type="text" name="daterange" value="${checkIn} - ${checkOut}"/>
                                   <input id="check-in" type="hidden" value="">
                                   <input id="check-out" type="hidden" value="">
                               </div>
                    </div><!-- end main-search-input-item -->
                    </div><!-- end main-search-input-item -->
                    <div class="main-search-input-item">
						<select class="custom-select" style="height: 50px;"  id="optionNo" name="optionNo" onchange='selectPeopleNum();'>
						<c:forEach begin='1' end='10' step='1' varStatus='status'>
							<c:choose>
								<c:when test='${ status.index eq peopleNum }'>
								  <option value="${ status.index }" selected>${ status.index } 명</option>
								</c:when>
								<c:otherwise>
								  <option value="${ status.index }" >${ status.index } 명</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						</select>
                        
                    </div><!-- end main-search-input-item -->
                    <div class="main-search-input-btn">
                        <button class="button theme-btn" type="button" onclick="submitSearch()">검색</button>
                    </div><!-- end main-search-input-btn -->
                     <!-- request 할 데이터 -->
        <form id="searched-data" action="../search/search.bam" method="get">
        	<input type="hidden" id="searched-place" name="searchPlace" value="${searchPlace}">
        	<input type="hidden" id="check-in" class="check-in" name="checkIn" value="${checkIn}">
        	<input type="hidden" id="check-out" class="check-out" name="checkOut" value="${checkOut}">
        	<input type="hidden" id="peopleNum" name="peopleNum" value="${peopleNum}">
        </form>
                </div><!-- end main-search-input -->
		
		</div>
		<div class="mypage">
           	 <div class="logo-right-content" style="position:relative !important; right:30% !important;" >
                <div class="side-user-menu-open" style="background-color:#ff6b6b !important ; width:50px !important; height:45.71px !important;">
                    <span class="la la-user" style="color:white !important ;  padding:13px !important;width:50px !important; height:20px !important;"></span>
                </div><!-- end side-user-menu-open -->
          </div><!-- end logo-right-content -->
		</div>

	</div>
	
	<div class="side-user-panel">
        <div class="humburger-menu">
            <div class="humburger-menu-lines side-menu-close"></div><!-- end humburger-menu-lines -->
        </div><!-- end humburger-menu -->
        <div class="side-menu-wrap side-user-menu-wrap">
            <div class="side-user-img">
                
                <h4 id="name" class="su__name">${member.name}</h4>

            </div>
            <c:if test="${member == null }">
            	<div>
            	<img src="/images/asdad.png" style="padding-left:15px">
            	</div>
            	</c:if>
            <ul class="side-menu-ul">
            	<c:if test="${member != null}">
                <li><a onclick="location.href='${pageContext.request.contextPath}/member/mypage.bam?selected=info'"><span class="la la-user user-icon"></span> 마이페이지</a></li>
                <li><a onclick="location.href='${pageContext.request.contextPath}/member/mypage.bam?selected=booking'"><span class="la la-list-alt user-icon"></span> 예약내역</a></li>
                <li><a onclick="location.href='${pageContext.request.contextPath}/member/mypage.bam?selected=heart'"><span class="la la-bookmark-o user-icon"></span> 찜 목록</a></li>
                <li><a onclick="location.href='${pageContext.request.contextPath}/owner/com_inquiry.bam'"><span class="la la-plus-circle user-icon"></span> 사업자 등록</a></li>
                </c:if>
                <c:if test="${member == null }">
                <li><a style="cursor:pointer" onclick="location.href='${pageContext.request.contextPath}/sign_up/sign_up_page.bam'"><span class="la la-user user-icon"></span> 회원가입 </a></li>
                <li><a style="cursor:pointer" onclick="location.href='${pageContext.request.contextPath}/login/login.bam'"><span class="la la-power-off user-icon"></span> 로그인 </a></li>
                </c:if>
                <c:if test="${member != null }">
                <c:choose>
                	<c:when test="${member.accessToken ne null}">
		                <li><a onclick="location.href='${pageContext.request.contextPath}/login/logout_naver?accessToken=${member.accessToken}'"><span class="la la-power-off user-icon"></span> 로그아웃</a></li>
                	</c:when>
                	<c:otherwise>
		                <li><a id="logout" onclick="location.href='${pageContext.request.contextPath}/login/logout.bam'"><span class="la la-power-off user-icon"></span> 로그아웃</a></li>
                	</c:otherwise>
                </c:choose>
                </c:if>
            </ul>
            <div class="side-user-search contact-form-action">
                <form method="post">
                    <div class="form-group mb-0">
                       
                    </div>
                    
                </form>
            </div><!-- end sidebar-widget -->
        </div><!-- end side-menu-wrap -->
    </div><!-- end side-user-panel -->

	  <div class="body">
	    <div class="list">
	    	<div class="list-list-camp">
	    	<c:forEach items="${vo.list}" var="list">
	
		    	<div class="list-grid-container" name="${list.camp_idx}">
				  <div class="list-campPic" onclick="clickCamp('${list.camp_idx}','${checkIn}','${checkOut}','${peopleNum}','${list.fname}')">
				  
				  	<div class="list-campPic-Wrap">
				  		<img class="campPic" src="/images/camp-img/thumb/${list.fname}">
				  	</div>
				  </div>
				  <div class="list-campInform">
				    <div class="list-campType" onclick="clickCamp('${list.camp_idx}','${checkIn}','${checkOut}','${peopleNum}','${list.fname}')">
				    <c:set var="fullAddr" value="${list.address}"/> 
				   		  <span class="location">${fn:substring(fullAddr, 0, 2)}</span> 지역의 <span class="type">캠핑장</span>
				   		   <input class="testAddr" type="hidden" value="${list.address}">
				   		   <input class="testLink" type="hidden" value="${list.camp_idx}">
				    </div>
				    <div class="list-campJJim">
				     <button class="heart" id="emptyHeart-${list.camp_idx}" onclick="fillHeart(this)">
				    	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	 					 <path fill-rule="evenodd" d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
						</svg>
					</button>
				     <button class="clickedHeart" id="heart-${list.camp_idx}" style="display:none;" onclick="emptyHeart(this)">
				    	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart-fill" fill="#ff6b6b" xmlns="http://www.w3.org/2000/svg">
				    	<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/></svg>
					</button>
				    </div>
				    <div class="list-campName" onclick="clickCamp('${list.camp_idx}','${checkIn}','${checkOut}','${peopleNum}','${list.fname}')">
				    	<h3 class="card-title">${list.camp_name}
	                      <i class="fa fa-check-circle" data-toggle="tooltip" data-placement="top" title="안전 캠핑 인증"></i>
	                   </h3>	
				    </div>
				    <div class="list-decoBar" onclick="clickCamp('${list.camp_idx}','${checkIn}','${checkOut}','${peopleNum}','${list.fname}')">
				   		<hr style="border:0; height:1px; width:3rem; background-color:#cacaca;">
				    </div>
				    <div class="list-campMoreInform" onclick="clickCamp('${list.camp_idx}','${checkIn}','${checkOut}','${peopleNum}','${list.fname}')">
				    	 ${list.intro}
				    </div>
				    <div class="list-campRating" onclick="clickCamp('${list.camp_idx}','${checkIn}','${checkOut}','${peopleNum}','${list.fname}')">
				 		   <div class="rating-rating">
	                            <c:forEach begin="1" end="${list.fullStarNum}" step="1">
									<span class="la la-star"></span>
								</c:forEach>
								<c:if test="${list.halfStarExist}">
									<span class="la la-star-half-full"></span>
								</c:if>
	                            <c:forEach begin="1" end="${list.emptyStarNum}" step="1">
									<span class="la la-star last-star"></span>
								</c:forEach>
	                             <span class="rating-count">${list.avgStar}</span>
	                        	</div>
				    </div>
				    <div class="list-campCharge" onclick="clickCamp('${list.camp_idx}','${checkIn}','${checkOut}','${peopleNum}','${list.fname}')">
				    	<span>₩</span><span class="charge">${list.min_fee}</span>
				    	<span style="font-weight: 300 !important;"><span>/</span><span class="campNight">1</span><span>박</span></span>
				    </div>
				  </div>
				</div>
				
				<div class="list-under-decoBar">
				  <hr style="border:1px;width:56.25rem;background-color:#9d9a9a;height:1px;">
				</div>
				
				</c:forEach>
				<c:if test="${empty vo}">
					<h3 style="text-align:center;">"검색 결과가 존재하지 않습니다."</h3>
				</c:if>
	    	
			</div>					
			
			<div class="list-list-button">
				<div class="button-shared mt-4 text-center">
                    <button id="loadMore" type="button" class="theme-btn border-0"><span class="la la-refresh"></span> 더보기</button>
                </div><!-- end button-shared -->
			</div>
			
	    </div>
	    
	    

	    <div class="map">
	    	<div id="kakaoMap">
	    	
	    	</div>	    	
	    </div>
</div>	    



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=[카카오앱키입력]&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('kakaoMap'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 10 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	var MyData = [];
	
	var titleData = document.getElementsByClassName('card-title');
	var addrData = document.getElementsByClassName('testAddr');
	var linkData = document.getElementsByClassName('testLink');
	var chargeData = document.getElementsByClassName('charge');
	
	for(var i =0; i<addrData.length ;i++){
		MyData.push({title : titleData[i].innerText , groupAddress : addrData[i].getAttribute('value'), link : linkData[i].getAttribute('value'), charge : chargeData[i].innerText });
	}
	
	
	for (let i=0; i < MyData.length ; i++) {
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(MyData[i].groupAddress, function(result, status) {
			
		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {
	
		        let coords = new daum.maps.LatLng(result[0].y, result[0].x);

		        let content = '<div class="myOverlay" id="mark-'+MyData[i].link+'" onclick="gotoCamp(this)"><span class="_1nq36y92">₩'+MyData[i].charge+'</span></div>';
		        
		        
		        let customOverlay = new kakao.maps.CustomOverlay({
		        	map: map,
		            position: coords,
		            content: content,
		            clickable: true
		        });
  
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        var markerPosition = customOverlay.getPosition(); 
		        map.relayout();
		        map.setCenter(markerPosition);
		    } 
		})
		
	}
	

</script>	





<script>

//주소값을 객체로 만드는 것 
	function get_query(){
	    var url = document.location.href;
	    var qs = url.substring(url.indexOf('?') + 1).split('&');
	    for(var i = 0, result = {}; i < qs.length; i++){
	        qs[i] = qs[i].split('=');
	        result[qs[i][0]] = decodeURIComponent(qs[i][1]);
	    }
	    result.searchPlace = result.searchPlace.replace(/\+/gi, ' ');
        console.log(result.searchPlace);
	    return result;
	}
	
	$("#loadMore").click(function(){
		//console.log(get_query());
		$.ajax({
		      url:"./loadMore.bam",
		      type:"POST",
		      data: get_query(),
		      dataType: "HTML",
		      contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		      success: function(result) {
		          if (result) {
		        	  $(".list-list-camp").append(result);
		        		///////////////////
		  			document.getElementById('kakaoMap').innerHTML = "";
		  			var mapContainer = document.getElementById('kakaoMap'), // 지도를 표시할 div 
		  			    mapOption = {
		  			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		  			        level: 10 // 지도의 확대 레벨
		  			    };  
		  			
		  			// 지도를 생성합니다    
		  			var map = new kakao.maps.Map(mapContainer, mapOption); 
		  	
		  	
		  			// 주소-좌표 변환 객체를 생성합니다
		  			var geocoder = new kakao.maps.services.Geocoder();
		  			
		  			var MyData = [];
		  			
		  			var titleData = document.getElementsByClassName('card-title');
		  			var addrData = document.getElementsByClassName('testAddr');
		  			var linkData = document.getElementsByClassName('testLink');
		  			var chargeData = document.getElementsByClassName('charge');
		  			
		  			for(var i =0; i<addrData.length ;i++){
		  				MyData.push({title : titleData[i].innerText , groupAddress : addrData[i].getAttribute('value'), link : linkData[i].getAttribute('value'), charge : chargeData[i].innerText });
		  			}
		  			
		  			
		  			for (let i=0; i < MyData.length ; i++) {
		  				// 주소로 좌표를 검색합니다
		  				geocoder.addressSearch(MyData[i].groupAddress, function(result, status) {
		  					
		  				    // 정상적으로 검색이 완료됐으면 
		  				     if (status === daum.maps.services.Status.OK) {
		  			
		  				        let coords = new daum.maps.LatLng(result[0].y, result[0].x);

		  				        // 결과값으로 받은 위치를 마커로 표시합니다
		  				         let content = '<div class="myOverlay" id="mark-'+MyData[i].link+'" onclick="gotoCamp(this)"><span class="_1nq36y92">₩'+MyData[i].charge+'</span></div>';
							        
							        let customOverlay = new kakao.maps.CustomOverlay({
							        	map: map,
							            position: coords,
							            content: content,
							            clickable: true
							        });
							      
							  	 /*  let infowindow = new daum.maps.InfoWindow({
							          map: map,  
							  		  content: myContent,
							  		  position: coords,
							  		  removable: true
							        });      */
							        
		  				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		  				        var markerPosition = customOverlay.getPosition(); 
		  				        map.relayout();
		  				        map.setCenter(markerPosition);
		  				        
		  				        //지도에 마커 이벤트 재부여
		  				      	let nodeList = document.querySelectorAll('.list-grid-container');

			  		  			for (let i=0;i<nodeList.length;i++){
			  		  				let node = nodeList.item(i);
			  		  				
			  		  				node.addEventListener('mouseover', function(){
			  		  					let markerId = 'mark-' + this.getAttribute('name');
			  		  					const mark = document.querySelector('#'+markerId);
			  		  					if(mark){
				  		  					mark.style.background = 'black';
				  		  					mark.style.color = 'white';
			  		  					}
			  		  				})
			  		  				node.addEventListener('mouseout', function(){
			  		  					let markerId = 'mark-' + this.getAttribute('name');
			  		  					const mark = document.querySelector('#'+markerId);
			  		  					if(mark){
				  		  					mark.style.background = 'white';
				  		  					mark.style.color = 'black';
			  		  					}
			  		  				})
			  		  			}
		  				    } 
		  				})
		  				
		  			}	 
		  			
		  			
		  			//location.href='#'; 
		          } else {
			        	  let loadMore = document.getElementById('loadMore');
			        	  loadMore.innerHTML = "<span class='la la-refresh'></span> No More";
			        	  loadMore.disabled = 'disabled';
		              //alert("데이터가 없습니다.");
		          }
		          $('#loadMore').focus();
		      },
		      error: function(request, status, error) {
		          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		      }
		  });

		
			
	})

</script>
				    
	  <div class="footer">
	    <div class="footer2">
			<div class="box-icon"></div>
		    <div class="box-icon"></div>
		    <div class="box-icon"></div>
		    <div class="box-icon"></div>
		    <div class="box-icon"></div>
		    <div class="box-icon"></div>
		     <div class="container">
		        <div class="row">
		            <div class="col-lg-3 column-td-6">
		                <div class="footer-item">
		                    <div class="logo">
		                        <a href="index.html" class="foot-logo"><img src="/images/asdad.png" alt="logo" height="60px"></a>
		                        <p class="footer__desc">
		                            불밤야밤 -- We provides camping reservation and We also offer camping information and community
		                        </p>
		                        <ul class="social-profile">
		                            <li>
		                                <a href="https://www.instagram.com/bulbam_yabam/">
		                                    <i class="fa fa-facebook" style="padding-top: 16px"></i>
		                                </a>
		                            </li>
		                            <li>
		                                <a href="https://www.instagram.com/bulbam_yabam/">
		                                    <i class="fa fa-twitter" style="padding-top: 16px"></i>
		                                </a>
		                            </li>
		                            <li>
		                                <a href="https://www.instagram.com/bulbam_yabam/">
		                                    <i class="fa fa-instagram" style="padding-top: 16px"></i>
		                                </a>
		                            </li>
		
		                        </ul>
		                    </div><!-- end logo -->
		                </div><!-- end footer-item -->
		            </div><!-- end col-lg-3 -->
		            <div class="col-lg-3 column-td-6">
		                <div class="footer-item">
		                    <h4 class="footer__title">Quick Links</h4>
		                    <ul class="list-items">
		                        <!-- <li><a href="/howto">사이트 활용법</a></li> -->
		                        <li><a href="/sign_up/sign_up_page.bam">회원가입</a></li>
		                        <li><a href="/login/login.bam">로그인</a></li>
		                        <li><a href="/trust">신뢰와 안전</a></li>
		                        <li><a href="/newsroom">뉴스룸</a></li>
		                    </ul>
		                </div><!-- end footer-item -->
		            </div><!-- end col-lg-3 -->
		            <div class="col-lg-3 column-td-6">
		                <div class="footer-item">
		                    <h4 class="footer__title">Categories</h4>
		                    <ul class="list-items">
		                        <li><a href="#">커뮤니티</a></li>
		                        <li><a href="#">친구 초대하기</a></li>
		                        <li><a href="/owner/add_camp.bam">캠핑장 등록</a></li>
		                        <li><a href="#">채용 정보</a></li>
		                        <li><a href="/owner/com_inquiry.bam">사업자 등록</a></li>
		                    </ul>
		                </div><!-- end footer-item -->
		            </div><!-- end col-lg-3 -->
		            <div class="col-lg-3 column-td-6">
		                <div class="footer-item">
		                    <h4 class="footer__title">Contact with Us</h4>
		                    <ul class="info-list contact-links">
		                        <li><span class="la la-home"></span> 대전 서구 대덕대로 182 10층</li>
		                        <li><span class="la la-headphones"></span> <a href="#">+ 81 042 123 1234</a></li>
		                        <li><span class="la la-envelope-o"></span> <a href="mailto:bulbamyabam@naver.com">bulbamyabam@naver.com</a></li>
		                    </ul>
		                </div><!-- end footer-item -->
		            </div><!-- end col-lg-3 -->
		        </div><!-- end row -->
		        <div class="row">
		            <div class="col-lg-12">
		                <div class="copy-right margin-top-50px padding-top-60px">
		                    <p class="copy__desc">
		                        &copy; Copyright 불밤야밤 2022. Made with
		                        <span class="la la-heart-o"></span>by <a href="https://github.com/leedooil">DI</a>, <a href="https://github.com/create1475" >SJ</a>, <a href="https://github.com/jeonghyun7" >JH</a>, <a href="https://github.com/dzzcheld" >HS </a>
		                    </p>
		                    <ul class="list-items">
		                        <li><a href="#">Terms & Conditions</a></li>
		                        <li><a href="#">Privacy Policy</a></li>
		                        <li><a href="#">Help Center</a></li>
		                    </ul>
		                </div><!-- end copy-right -->
		            </div><!-- end col-lg-12 -->
		        </div><!-- end row -->
		    </div><!-- end container -->
    </div>
    </div>
</section><!-- end footer-area -->
<!-- ================================
       START FOOTER AREA
================================= -->

<!-- start back-to-top -->
<div id="back-to-top">
    <i class="fa fa-angle-up" title="Go top" style="padding:5px !important"></i>
</div>
<!-- end back-to-top -->

<script>
	function clickCamp(camp_idx, checkIn, checkOut, peopleNum, thumb){
		localStorage.setItem('thumb', thumb);
		location.href="../camp/camp_detail.bam?camp_idx="+camp_idx+"&checkIn="+checkIn+"&checkOut="+checkOut+"&peopleNum="+peopleNum;
	}

	function gotoCamp(e){
		const buttonId = e.getAttribute('id');
		const strList = buttonId.split('-');
		const camp_idx = strList[1];
	  	location.href = "../camp/camp_detail.bam?camp_idx="+camp_idx 
	}

	window.addEventListener('DOMContentLoaded', function(){
		<c:if test="${empty vo}">
			document.body.style.display = "none";
			alert("검색 결과가 존재하지 않습니다.");
			location.href="../"
		</c:if>
	})

</script>

<!-- for search JS -->
<script src="/js/search.js"></script>
<!-- for commat format -->
<script src="/js/comma-format.js"></script>
<!-- for heart JS -->
<script src="/js/heart.js"></script>
<!-- for Marker Hover -->
<script src="/js/markerHover.js"></script>

<!-- Template JS Files -->
<script src="/js/jquery.min.js"></script>
<script src="/js/jquery-ui.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/owl.carousel.min.js"></script>
<script src="/js/jquery.magnific-popup.min.js"></script>
<script src="/js/isotope-3.0.6.min.js"></script>
<script src="/js/animated-headline.js"></script>
<script src="/js/select2.min.js"></script>
<script src="/js/moment.min.js"></script>
<script src="/js/daterangepicker.js"></script>
<script src="/js/waypoints.min.js"></script>
<script src="/js/jquery.counterup.min.js"></script>
<script src="/js/jquery.show-more.js"></script>
<script src="/js/jquery-rating.js"></script>
<script src="/js/jquery.filer.min.js"></script>
<script src="/js/smooth-scrolling.js"></script>
<script src="/js/main.js"></script>
</body>