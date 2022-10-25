<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<section class="breadcrumb-area">
    <div class="breadcrumb-wrap">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-content">
                        <h2 class="breadcrumb__title">사업자 등록</h2>
                    </div><!-- end breadcrumb-content -->
                </div><!-- end col-lg-12 -->
            </div><!-- end row -->
        </div><!-- end container -->
    </div><!-- end breadcrumb-wrap -->
    <div class="bread-svg">
        <svg viewBox="0 0 500 150" preserveAspectRatio="none">
            <path d="M-4.22,89.30 C280.19,26.14 324.21,125.81 511.00,41.94 L500.00,150.00 L0.00,150.00 Z"></path>
        </svg>
    </div><!-- end bread-svg -->
</section><!-- end breadcrumb-area -->
<!-- ================================
    END BREADCRUMB AREA
================================= -->

<!-- ================================
    START ADD-LISTING AREA
================================= -->
<section class="add-listing-area padding-top-40px padding-bottom-100px">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 mx-auto">
                <div class="billing-form-item">
                    <div id='focus-here' class="billing-title-wrap">
                        <h3 class="widget-title pb-0">사업자 등록</h3>
                        <div class="title-shape margin-top-10px"></div>
                    </div><!-- billing-title-wrap -->
                    <div class="billing-content">
                        <div class="contact-form-action">
                                <div class="row">
                                    <div class="col-lg-12">
                                    	<div id="check-input">
										</div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="input-box">
                                            <label class="label-text d-flex align-items-center ">이메일
                                                <i class="la la-exclamation tip ml-1" onclick="email_required();"></i>
                                            </label>
                                            <div class="form-group">
                                                <span class="la la-pencil-square-o form-icon"></span>
                                                <input class="form-control" type="text" id="text1" name="name" readonly value="${member.email}">
                                            </div>
                                        </div>
                                    </div><!-- end col-lg-6 -->
                                    <div class="col-lg-6">
                                        <div class="input-box">
                                            <label class="label-text d-flex align-items-center ">사업자번호
                                                <i class="la la-exclamation tip ml-1" onclick="business_num_required();"></i>
                                            </label>
                                            <div class="form-group">
                                                <span class="la la-pencil-square-o form-icon"></span>
                                                <input class="form-control businessNum" type="text" id="text2" name="name" placeholder="사업자 번호를 입력해 주세요" maxlength="12">
                                            </div>
                                        </div>
                                    </div><!-- end col-lg-6 -->
                                    
									<div class="col-lg-12" style="margin-bottom: 20px">
										<div class="input-box">
											<label class="label-text">회사 주소</label>
										</div>
										<div class="input-group">
											<!-- <input id="addrZip" style="width:500px">
                                            <input type="button" id="bt_addr" onclick="bt_addr_click();" value="주소 찾기">  -->
											<!-- <span class="la la-pencil-square-o form-icon"></span> -->
											<input class="form-control" type="text" id="sample5_address"
												placeholder="주소"> <input type="button"
												onclick="sample5_execDaumPostcode()"
												class="theme-btn border-0 check" style="margin-left: 20px"
												value="주소 검색">
										</div>

										<div id="map"
											style="height: 300px; margin-top: 10px; display: none"></div>
									</div>
									
									<!-- end col-lg-12 -->
                                    <div class="col-lg-6">
                                        <div class="input-box">
                                            <label class="label-text d-flex align-items-center ">회사명
                                            </label>
                                            <div class="form-group">
                                                <span class="la la-pencil-square-o form-icon"></span>
                                                <input class="form-control" type="text" id="text4" name="name" placeholder="회사명을 입력해 주세요">
                                            </div>
                                        </div>
                                    </div><!-- end col-lg-6 -->
                                    
                                    <div class="col-lg-6">
                                        <div class="input-box">
                                            <label class="label-text d-flex align-items-center ">회사 연락처
                                            </label>
                                            <div class="form-group">
                                                <span class="la la-pencil-square-o form-icon"></span>
                                                <input class="form-control phoneNum" type="text" id="text5" name="name" placeholder="회사 연락처를 입력해 주세요" maxlength="13">
                                            </div>
                                        </div>
                                    </div><!-- end col-lg-6 -->
                                    									
                                    <div class="col-lg-12">
                                        <div class="input-box">
                                            <label class="label-text">제목</label>
                                            <div class="form-group">
                                                <span class="la la-pencil-square-o form-icon"></span>
                                                <input class="form-control" type="text" id="text6" name="name" placeholder="문의 제목을 입력해 주세요">
                                            </div>
                                        </div>
                                    </div><!-- end col-lg-12 -->
                                    
                                    <div class="col-lg-12">
                                        <div class="input-box">
                                            <label class="label-text">내용
                                             	<i class="la la-exclamation tip ml-1" onclick="content_required();"></i>
                                            </label>
                                            <div class="form-group">
                                                <span class="la la-pencil form-icon"></span>
                                                <textarea class="message-control form-control" id="text7" name="message" placeholder="문의 목적을 작성해 주세요"></textarea>
                                            </div>
                                        </div>
                                    </div><!-- end col-lg-12 -->
                                </div><!-- end row -->
                        </div><!-- end contact-form-action -->
                    </div><!-- end billing-content -->
                </div><!-- end billing-form-item -->
                
               <form action="inquiry.bam" method="post" id="submit-inquiry">
                    <input type='hidden' name='email' id='email'>
                    <input type='hidden' name='owner_num' id='owner_num'>
                    <input type='hidden' name='com_name' id='com_name'>
                    <input type='hidden' name='com_addr' id='com_addr'>
                    <input type='hidden' name='com_tel' id='com_tel'>
                    <input type='hidden' name='title' id='title'>
                    <input type='hidden' name='content' id='content'>
               </form>
               <div class="d-flex justify-content-between">
			    <div class="invisible">
				 <button type="button" class="btn btn-info">Panel</button>
			    </div>
			    <div class="show">
                 <div class="btn-box mt-4">
                  <button type="button" class="theme-btn border-0" onclick="setInputs();">작성하기</button>
                 </div><!-- end btn-box -->
			    </div>
			    <div class="invisible">
				 <button type="button" class="btn btn-info">Panel</button>
			    </div>
		       </div>
                
            </div><!-- end col-lg-9 -->
        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end add-listing-area -->
<!-- ================================
    END ADD-LISTING AREA
================================= -->
<!-- ================================
	JAVASCRIPT
================================= -->
<script src="/js/com-inquiry.js?ver=<%=System.currentTimeMillis()%>"></script>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=[카카오앱키입력]&libraries=services"></script>

<script>
$(document).ready(function(){
	var check = "<%=session.getAttribute("member")%>";
	console.log(check);
	if(check == null){
		alert("로그인 하신 후에 이용 하실 수 있습니다.");
		location.href ="/login/login.bam";
	}
	if(<%=request.getAttribute("continue")%> == 1){
		alert("작성하신 문의가 아직 처리 되지 않았습니다.");
		location.href = "/";
	} else if(<%=request.getAttribute("continue")%> == 2){
		alert("사업자 등록 처리가 이미 완료 되었습니다.");
		location.href = "/member/mypage.bam";
	}
	if(<%=request.getAttribute("result")%> == true){
		alert("사업자 등록 문의가 작성되었습니다.");
		location.href="/";
	}else if(<%=request.getAttribute("result")%> == false){
		alert("사업자 등록 문의가 실패하였습니다.");
		location.href="/";
	}
})

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
		center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		level : 5
	// 지도의 확대 레벨
	};

	//지도를 미리 생성
	var map = new daum.maps.Map(mapContainer, mapOption);
	//주소-좌표 변환 객체를 생성
	var geocoder = new daum.maps.services.Geocoder();
	//마커를 미리 생성
	var marker = new daum.maps.Marker({
		position : new daum.maps.LatLng(37.537187, 127.005476),
		map : map
	});

	function sample5_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = data.address; // 최종 주소 변수

				// 주소 정보를 해당 필드에 넣는다.
				document.getElementById("sample5_address").value = addr;
				// 주소로 상세 정보를 검색
				geocoder.addressSearch(data.address, function(results, status) {
					// 정상적으로 검색이 완료됐으면
					if (status === daum.maps.services.Status.OK) {

						var result = results[0]; //첫번째 결과의 값을 활용

						// 해당 주소에 대한 좌표를 받아서
						var coords = new daum.maps.LatLng(result.y, result.x);
						// 지도를 보여준다.
						mapContainer.style.display = "block";
						map.relayout();
						// 지도 중심을 변경한다.
						map.setCenter(coords);
						// 마커를 결과값으로 받은 위치로 옮긴다.
						marker.setPosition(coords)
					}
				});
			}
		}).open();
	}
	
	
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
	
	var phoneNum = document.getElementsByClassName('phoneNum');
	for(let k=0; k<phoneNum.length; k++){
		phoneNum[k].onkeyup = function(){
		  this.value = autoHypenPhone( this.value ) ;  
		}
	}

	/* 전화번호 하이픈  */
	var autoHypenBusinessNum = function(str){
	      str = str.replace(/[^0-9]/g, '');
	      var tmp = '';
	      if( str.length < 4){
	          return str;
	      }else if(str.length < 6){
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3);
	          return tmp;
	      }else{              
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3, 2);
	          tmp += '-';
	          tmp += str.substr(5);
	          return tmp;
	      }	  
	      return str;
	}
	
	var businessNum = document.getElementsByClassName('businessNum');
	for(let k=0; k<businessNum.length; k++){
		businessNum[k].onkeyup = function(){
		  this.value = autoHypenBusinessNum( this.value ) ;  
		}
	}
	
</script>
</body>
