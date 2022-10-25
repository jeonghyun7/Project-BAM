<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 이용 약관 보기 스크롤 -->
<style>
::-webkit-scrollbar {
 width: 6px;
}
::-webkit-scrollbar-track {
 background-color: transparent;
}
::-webkit-scrollbar-thumb {
 border-radius: 3px;
 background-color: gray;
}
::-webkit-scrollbar-button {
 width: 0;
 height: 0;
}
.margin-left-option{
	margin-left:20px;
}
.tt:hover {background-color: tomato}



.tt:active {

  background-color: #3e8e41;

  box-shadow: 0 5px #666;

  transform: translateY(4px);

}


</style>

<!-- ================================
    START BREADCRUMB AREA
================================= -->
 <section class="breadcrumb-area">
    <div class="breadcrumb-wrap">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-content">
                        <h2 class="breadcrumb__title">예약 확인</h2>
                    </div><!-- end breadcrumb-content -->
                </div><!-- end col-lg-12 -->
            </div><!-- end row -->
        </div><!-- end container -->
    </div><!-- end breadcrumb-wrap
    <div class="bread-svg">
        <svg viewBox="0 0 500 150" preserveAspectRatio="none">
            <path d="M-4.22,89.30 C280.19,26.14 324.21,125.81 511.00,41.94 L500.00,150.00 L0.00,150.00 Z"></path>
        </svg>
    </div> --><!-- end bread-svg-->
</section> <!-- end breadcrumb-area -->
<!-- ================================
    END BREADCRUMB AREA
================================= -->

<!-- ================================
    START BOOKING AREA
================================= -->
<section class="booking-area padding-top-40px padding-bottom-80px">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="billing-form-item">
                    <div class="billing-title-wrap">
                        <h3 class="widget-title pb-0">예약 정보</h3>
                        <div class="title-shape margin-top-10px"></div>
                    </div><!-- billing-title-wrap -->
                    <div class="billing-content">
                        <div class="contact-form-action">
                                 <div class="col-lg-6">
                                        <div class="input-box">
                                            <label class="label-text">날짜</label>
                                            <div class="form-group booking_date">
                                                	
                                            </div>
                                        </div>
                                 </div><!-- end col-lg-6 -->
                                 <div class="col-lg-6">
                                        <div class="input-box">
                                            <label class="label-text">인원</label>
                                            <div class="form-group peopleNum">
                                            </div>
                                        </div>
                                 </div><!-- end col-lg-6 -->
                            	<form id="noForm" name="noValueForm">
                                 <div class="col-lg-6">
                                        <div class="input-box">
                                            <label class="label-text">예약자 성함</label>
                                            <div class="form-group">
                                                <span class="la la-user form-icon"></span>
                                                <input id="reserver_name"  onkeyup="setName();" class="form-control" type="text" name="noValue" placeholder="예약자 성함을 입력하세요." maxlength="5" value="${member.name}" required/>
                                            </div>
                                        </div>
                                 </div><!-- end col-lg-6 -->
                                 <div class="col-lg-6">
                                        <div class="input-box">
                                            <label class="label-text">예약자 번호</label>
                                            <div class="form-group">
                                                <span class="la la-phone form-icon"></span>
                                                <input id="phone_num" class="form-control" type="text" name="noValue" placeholder="휴대폰 번호를 입력하세요." maxlength="13" required/>
                                            </div>
                                        </div>
                                 </div><!-- end col-lg-6 -->
                                 <div class="col-lg-12">
                                        <div class="input-box">
                                            <label class="label-text">메모</label>
                                            <div class="form-group">
                                             <span class="la la-pencil form-icon"></span>
                                                <textarea class="form-control" id="buyer_memo" name="noValue" onkeyup="setMemo();" rows="5" placeholder="요청사항을 입력해주세요." required></textarea>
                                            </div>
                                        </div>
                                 </div><!-- end col-lg-6 -->
                             </form>
                           <!-- </form> -->
                        </div><!-- end contact-form-action -->
                    </div><!-- end billing-content -->
                     
                     
                     <div class="billing-title-wrap pt-0">
                            <h3 class="widget-title pb-0">가격 및 할인 정보</h3>
                            <div class="title-shape margin-top-10px"></div>
                     </div><!-- billing-title-wrap -->
   			
                           
   			
   			 				<ul class="booking-list">
                                <li class="d-flex align-items-center justify-content-between"
                                	style="font-size:15px;color:#333f57;font-weight:600;margin-top:15px;margin-bottom:10px; margin-left:40px;margin-right:20px;">
                                	 서비스 수수료(원) <span class="service_fee"></span>
                                </li>
                                <li class="d-flex align-items-center justify-content-between"
                                    style="font-size:15px;color:#333f57;font-weight:600;margin-top:7px; margin-bottom:10px; margin-left:40px;margin-right:20px;">
                                                                                캠핑 이용료(원) <span class="camp_fee"></span></li>
                                <li class="d-flex align-items-center justify-content-between"
                                    style="font-size:15px;color:#333f57;font-weight:600;margin-top:7px; margin-bottom:10px; margin-left:40px;margin-right:20px;">
                                                                                 바베큐 이용료 (원)<span class="bbq_fee"></span></li>
                                <li class="d-flex align-items-center justify-content-between"
                                    style="font-size:15px;color:#333f57;font-weight:600;margin-top:7px; margin-bottom:3px; margin-left:40px;margin-right:20px;">
                                                                                포인트(P)<input id="point"  class="form-control point" type="text" style="width:170px; text-align:right;"  placeholder="0" value=""></li>
                                <li style="cursor:pointer; text-align:right; font-size:15px;color:#333f57;font-weight:600;margin-top:7px; margin-bottom:10px; margin-left:40px;margin-right:20px;">
                                                                                 보유 : <span id="my_point">${member.point}</span>P&nbsp;&nbsp;<a id="bt_use_point"type="button" style="text-decoration:underline; color:#ff6b6b""> 전액 사용</a></li>
								<!-- <li style="cursor:pointer; font-size:15px;color:#ff6b6b;font-weight:600;margin-top:7px; margin-bottom:10px; margin-left:600px;margin-right:20px;">
									 &nbsp;<u>전액 사용</u>
								</li> -->
                            </ul>
                            <!-- <div class="section-block-2 mt-4"></div> -->
                            <ul class="booking-list total-list mt-4">
                                <li class="d-flex align-items-center justify-content-between"
                                style="font-size:20px;color:#ff6b6b;font-weight:600;margin-top:7px; margin-bottom:40px;margin-left:40px;margin-right:20px;">
                                                                        총 액(원)
                                <span class="color-text camp_total"style="font-size:20px;color:#333f57;font-weight:600;"></span></li>
                            </ul>		 
   					 
                    
                    <div class="payment-option">
                        <div class="billing-title-wrap pt-0">
                            <h3 class="widget-title pb-0">결제 수단</h3>
                            <div class="title-shape margin-top-10px"></div>
                        </div><!-- billing-title-wrap -->
                        <div class="payment-method-wrap p-4">
                        <div class="payment-tab">
                                <div class="payment-trigger">
                                    <label class="payment-radio">
                                        <input type="radio" name="radio" checked="checked">
                                        <span class="checkmark"></span>
                                       <img src="https://img.icons8.com/android/24/000000/bank-card-back-side.png"/>
                                       </span><span> &nbsp;카드</span>
                                    </label>
                                </div><!-- end payment-trigger -->
                        </div><!-- end payment-tab -->
                      </div>
                       </div> 
                        <!--start 이용약관-->
                        <div class="billing-title-wrap pt-0">
                        <h3 class="widget-title pb-0">이용 약관</h3>
                        <div class="title-shape margin-top-10px"></div>
						</div>
                        <div class="margin-left-option">
                           <!--  <div class="section-block-2 mt-4"></div> 얇은 실선-->
                           <div class="btn-box mt-4">
                                <div class="custom-checkbox">
                               		<input type="checkbox" id="chbAll">
                                    <label for="chbAll" style="font-size:17px; font-weight: bold; margin-bottom:10px">전체 동의 </label>
                                    <input type="checkbox" id="chb1" class="chb" name="chb" id="chb1">
                                    <label style="margin-bottom:5px"for="chb1">[필수] 만 14세 이상 이용 동의 </label>
                                    <input type="checkbox" id="chb2" class="chb" name="chb" id="chb2">
                                    <label for="chb2" style="margin-bottom:5px" class="d-flex align-items-center justify-content-between">[필수] 이용규칙 동의
                                    
                                    <a id="bt_use" role="button" class="color-text" data-toggle="collapse" style="margin-right:20px">보기</a></label>
				                        <div id="rules1" class="collapse">
				                      	  <div id="rules_area1"class="card card-body" style="overflow:scroll; width:725px; height:200px;">
										    이용규칙
										  </div>
										</div>
                                    
                                    <input type="checkbox" id="chb3" class="chb" name="chb" id="chb3">
                                    <label for="chb3" style="margin-bottom:5px" class="d-flex align-items-center justify-content-between">[필수] 취소 및 환불 규칙 동의
                                     <a id="bt_refund" role="button" class="color-text" data-toggle="collapse"  style="margin-right:20px">보기</a></label>
				                        <div id="rules2" class="collapse">
				                      	  <div id="rules_area2"class="card card-body" style="overflow:scroll; width:725px; height:200px;">
										    취소 및 환불 규칙
										  </div>
										</div>
                                    
                                    <input type="checkbox" id="chb4" class="chb" name="chb" id="chb4">
                                    <label for="chb4" style="margin-bottom:5px" class="d-flex align-items-center justify-content-between">[필수] 개인정보 수집 및 이용 동의 
                                    <a id="bt_privacy" role="button" class="color-text" data-toggle="collapse"  style="margin-right:20px">보기</a></label>
				                        <div id="rules3" class="collapse">
				                      	  <div id="rules_area3"class="card card-body" style="overflow:scroll; width:725px; height:200px;">
										    개인정보 수집 및 이용 규칙
										  </div>
										</div>
                                    
                                    <input type="checkbox" id="chb5" class="chb" name="chb" id="chb5">
                                    <label for="chb5" style="margin-bottom:5px" class="d-flex align-items-center justify-content-between">[필수] 개인정보 제3자 제공 동의
                                    <a id="bt_privacy3" role="button" class="color-text" data-toggle="collapse"  style="margin-right:20px">보기</a></label>
				                        <div id="rules4" class="collapse">
				                      	  <div id="rules_area4"class="card card-body" style="overflow:scroll; width:725px; height:200px;">
										    개인정보 제3자 제공 규칙
										  </div>
										</div>
                                    <!-- <input class="chb" type="checkbox" id="chb5">
                                    <label for="chb1">[필수] 개인정보 제3자 제공 동의 <a href="#" class="color-text">보기</a></label> -->
                                </div><!--end btn-box mt-4-->
                            </div> <!--end checkbox-->
                            </div><!-- end margin-left-option-->
                                <button disabled="" id="bt_pay" class="tt theme-btn border-0" onclick="requestPay()" type="submit"
                                		style="background-color:#bfbbbb; border-color:#bfbbbb; margin-left:20px; margin-bottom:10px; padding:3px 300px;cursor:pointer" type="submit" ><span id="camp_total" class="camp_total"></span>원 결제하기
                                </button>
                                <!--버튼 원래 클래스 - theme-btn border-0 mt-5--><!--btns btn-primary btn-block-->
                </div><!-- end billing-form-item -->
            </div><!-- end col-lg-8 -->


            <div class="col-lg-4">
                <div class="card-item">
                    <!--  <a class="card-image-wrap"> -->
                        <div class="card-image">
                            <img id="camp_thumb" src="" class="card__img" alt="">
                            <span class="badge" style="color:white"> <span class="la la-star"></span><span id="avgStar">4.6</span></span>
                        </div>
                    <!-- </a> -->
                    <div class="card-content-wrap">
                        <div class="card-content">
                        <!-- margin-top:10px; margin-bottom:20px; -->
                                <h3 id="campName" style="font-size:30px;color:#333f57;font-weight:600;margin-top:7px; margin-bottom:10px;"></h3>
                                <p id="campAddress" class="card-sub"></p>
                        </div>
                    </div><!-- end card-content-wrap -->
                </div><!-- end 숙소 요약 정보 -->
                <div class="billing-form-item">
                    <div class="billing-title-wrap">
                        <h3 class="widget-title pb-0">요약 정보</h3>
                        <div class="title-shape margin-top-10px"></div>
                    </div><!-- billing-title-wrap -->
                    <div class="billing-content">
                        <div class="booking-summary">
                            <ul class="booking-list">
                                <li class="d-flex align-items-center justify-content-between">날짜 <span class="booking_date"></span></li>
                                <li class="d-flex align-items-center justify-content-between">인원 <span class="peopleNum"></span></li>
                                <li id="charge" class="d-flex align-items-center justify-content-between"data-container="body" data-toggle="popover"
                                	data-content="수수료는 불밤야밤 플랫폼을 운영하고 연중무휴 고객 지원과 같은 다양한 서비스를 제공하는데 사용됩니다." data-placement="left"
                                	style="cursor:pointer">
                                	 <u>서비스 수수료(원)</u> <span class="service_fee"></span>
                                </li>
                                <li class="d-flex align-items-center justify-content-between">캠핑 이용료(원) <span class="camp_fee"></span></li>
                                <li class="d-flex align-items-center justify-content-between">바베큐 이용료(원)<span class="bbq_fee"></span></li>
                                <li class="d-flex align-items-center justify-content-between">포인트(P) <span class="point" id="use_point"></span></li>
                            </ul>
                            <div class="section-block-2 mt-4"></div>
                            <ul class="booking-list total-list mt-4">
                                <li class="d-flex align-items-center justify-content-between">총 액(원)<span class="color-text camp_total"></span></li>
                            </ul>
                        </div><!-- end booking-summary -->
                    </div><!-- end billing-content -->
                </div><!-- end billing-form-item -->
            </div><!-- end col-lg-4 -->
        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end booking-area-->


<!-- ================================
    END BOOKING AREA
================================= -->
<!-- ================================
    FORM AREA
================================= -->

<form name="buyerInformation" method="post" action="./payment.bam">
<input id="imp_uid" name="imp_uid" type="hidden" value="0">
<input id="camp_idx" name="camp_idx" type="hidden" value="0">
<input id="sort_idx" name="sort_idx" type="hidden" value="0">
<input id="buyer_email" name="email" type="hidden" value="${member.email}">
<input id="amount" name="total_fee" type="hidden" value="0">
<input id="udate" name="udate" type="hidden" value="0">
<input id="buyer_tel" name="tel" type="hidden" value="0">
<input id="memo" name="memo" type="hidden" value="요청사항이 없습니다.">
<input id="people_num" name="p_num" type="hidden" value="0">
<input id="buyer_name" name="name" type="hidden" value="${member.name}">
<input id="service_fee" name="service_fee" type="hidden" value="0">
<input id="my_points" name="my_point" type="hidden" value="0">

<input id="pay_fee" name="pay_fee" type="hidden" value="0">
<input id="use_points" name="use_point" type="hidden" value="0">

<%-- <input id="camp_thumb2" name="thumb" type="hidden" value="${bestCamp.fname}"> --%>
<!--포인트 사용 후 남은 포인트 값-->
<input id="remaining_point" name="remaining_point" type="hidden" value="0">
</form>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="/js/comma-format.js"></script>
<script src="/js/custom-booking.js"></script>
<script src="/js/payment.js"></script>
<!-- <script src="/js/login-check-modul.js"></script> -->