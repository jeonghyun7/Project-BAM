<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style>
.star_grade a {
	text-decoration: none;
	color: gray;
}

.star_grade a.on {
	color: #ffc400;
}
.refund-li {
	font-size:15px;
	color:#333f57;
	font-weight:600;
	margin-top:7px; 
	margin-bottom:10px;
	margin-left:40px;
	margin-right:20px;
}

</style>
<script>
	var prev = 0;
	$('.star_grade a').click(function(){
	    $('a').removeClass('on');
		$(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
	    $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
	    //alert($('.on').length);
	    let e = this.nextSibling.nextSibling.value;
	    if(prev == 0){
	    	prev = String(e);
	    	document.getElementById('star-' + e).value = $('.on').length;
	    }else{
	    	document.getElementById('star-' + prev).value = 0;
	    	prev = 0;
	    	document.getElementById('star-' + e).value = $('.on').length;
	    }
	    return false;
	});	
</script>
<c:if test="${page.currentPage == 1}">
	<input type="hidden" id="page-count" value="${page.pageCount}">
</c:if>
<c:forEach items="${list}" var="list" varStatus="index">
	<div class="col-lg-4 column-td-6">
		<div class="card-item">

			<a href="../camp/camp_detail.bam?camp_idx=${list.camp_idx}"
				class="card-image-wrap">
				<div class="card-image">
					<img src="/images/camp-img/thumb/${list.fname}" class="card__img" height="250px">
				</div>
			</a>

			<div class="card-content-wrap">
				<div class="card-content">
					<a href="../camp/camp_detail.bam?camp_idx=${list.camp_idx}">
						<h4 class="card-title mt-0">${list.camp_name}</h4>
						<p class="card-sub">${list.address}</p>
						<p class="card-sub">${ list.check_in } ~ ${ list.check_out }</p>
					</a>
				</div>
				<div class="rating-row">
					<div class="edit-info-box">
						<!-- /////////////////////////// 리뷰 작성 버튼 열기 ///////////////////////////// -->
						<!-- Button trigger modal -->
						<c:if test="${list.review_state eq 'F' and list.s_no eq 1}">
							<button type="button" class="theme-btn button-success border-0"
								data-toggle="modal" data-target="#exampleModal${list.imp_uid}"
								id="#modal_show${list.imp_uid}"
								href="#modal_show${list.imp_uid}">
								<span class="la la-pencil-square"></span> 리뷰 작성
							</button>
						</c:if>
						<c:if test="${list.review_state eq 'F' and list.s_no eq 1 and list.using_state eq 'F'}">
						<button type="button" class="theme-btn border-0" 
								data-toggle="modal" data-target="#refundModal${list.imp_uid}" onclick="setVal('${list.imp_uid}');"
								id="#modal_show${list.imp_uid}"
								href="#modal_show${list.imp_uid}">
								<span class="la la-krw"></span> 환불 요청
						</button>
						</c:if>
						<c:if test="${list.review_state eq 'T'}">
							<button type="button" class="theme-btn button-info border-0"
								id="#modal_show${list.imp_uid}" disabled>
								<span class="la la-check-square-o"></span> 리뷰 완료
							</button>
						</c:if>

						<c:if test="${list.s_no eq 2}">
							<button type="button" class="theme-btn button-info border-0" onclick="setVal('${list.imp_uid}');"
								id="#modal_show${list.imp_uid}" data-toggle="modal" data-target="#refundModal${list.imp_uid}">
								<span class="la la-money"></span> 환불 완료
							</button>
						</c:if>

						<!-- Modal -->
						<div class="modal fade" id="exampleModal${list.imp_uid}"
							tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<input type="hidden" id="1">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">리뷰 작성</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<article>
											<div class="container" role="main">
												<h4 align="center">${list.camp_name}</h4>
												<form name="form" id="form${list.imp_uid}" method="post" action="add_review.bam">
													<input type="hidden" id="star-${list.imp_uid}" value="0" name="star">
													<input type="hidden" value="${list.camp_idx}" name="camp_idx">
													<input type="hidden" value="${list.imp_uid}" name="imp_uid">
													
													<div class="mb-3">
														<label for="reg_id">작성자</label>
													    <input type="text" class="form-control" name="reg_id" id="" value="${list.email}" readonly>
													</div>
													<div class="mb-3">
														<label for="reg_id">별점 주기</label>
														<div>
															<p id="star_grade${list.imp_uid}" class="star_grade" style="font-size: 20px;">
																<input type="hidden" value="${list.imp_uid}">
																	<a href="">★</a>
																<input type="hidden" value="${list.imp_uid}">
																 	<a href="">★</a>
																<input type="hidden" value="${list.imp_uid}">
																 	<a href="">★</a>
																<input type="hidden" value="${list.imp_uid}">
																    <a href="">★</a>
																<input type="hidden" value="${list.imp_uid}">
																	<a href="">★</a>
																<input type="hidden" value="${list.imp_uid}">
															</p>
														</div>
													</div>
													<div class="mb-3">
														<label for="content">내용</label>
														<textarea class="form-control" rows="5" name="content"
															id="" placeholder="이번 캠핑은 어떠셨나요? 리뷰를 작성해 주세요!"></textarea>
													</div>
												</form>
											</div>
										</article>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary" onclick="submit_review('${list.imp_uid}');">작성 완료</button>
										<button type="button" class="btn btn-secondary"	data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
						<!-- /////////////////////////// 리뷰 작성 버튼 닫기 ///////////////////////////// -->
						
					<%-- <form method="post" id="form${list.imp_uid}" action="update_booking.bam"> --%>
                    <!-- Modal -->
                    <div class="modal fade" id="refundModal${list.imp_uid}" tabindex="-1"
                        role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                <c:if test="${list.s_no eq '1'}">
                                    <h5 class="modal-title" id="exampleModalLabel">예약 취소</h5>
								</c:if>
                                <c:if test="${list.s_no eq '2'}">
                                 	<h5 class="modal-title" id="exampleModalLabel">환불 내역</h5>
                                </c:if>
                                    <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <input id="check_in${list.imp_uid}" type="hidden" value="${list.check_in}">
                                <input id="total_fee${list.imp_uid}" type="hidden" value="${list.total_fee}">
                                <input id="pay_fee${list.imp_uid}" type="hidden" value="${list.pay_fee}">
                                <input id="imp_uid${list.imp_uid}" type="hidden" value="${list.imp_uid}">
                                <input id="my_point${list.imp_uid}" type="hidden" value="${member.point}">
                                <input id="use_point${list.imp_uid}" type="hidden" value="${list.use_point}">
                                <input id="save_point${list.imp_uid}" type="hidden" value="${list.save_point}">
                                <input id="email${list.imp_uid}" type="hidden" value="${list.email}">
								
                                <div class="modal-body" align='center'>
                                <c:if test="${list.s_no eq '1'}">
                                        <div style="margin-top:50px; margin-bottom:50px; color:#ff6b6b; font-size:14px; background-color:#f2f2f2">
                                      			정말 취소하시겠어요?<br/>
                                      			아래 내용을 꼭 확인해 주세요.
                                        </div>
                                </c:if>
                                <c:if test="${list.s_no eq '2'}">
                                <div style="margin-top:50px; margin-bottom:50px; color:#ff6b6b; font-size:14px; background-color:#f2f2f2">
                              			환불 내역입니다.<br/>
                              			아래 내용을 확인해 주세요.
                                </div>
                                </c:if>
                                <ul class="payment-details">
                                
                                <li class="d-flex align-items-center justify-content-between refund-li">
                                                                                예약 날짜 <span class="">${list.bdate}</span></li>
                                <li class="d-flex align-items-center justify-content-between refund-li">
                                                                                이용 날짜 <span class="">${list.check_in} ~ ${list.check_out}</span></li>
                                <li class="d-flex align-items-center justify-content-between refund-li">
                                	 판매 금액(원) <span class="total_fee${list.imp_uid}" style="text-decoration:underline; color:#ff6b6b"><%-- ${list.total_fee} --%></span>
                                </li>
                                <div class="section-block" style="border:3px"></div>
                                <li class="d-flex align-items-center justify-content-between refund-li">
                                                                                결제 금액(원) <span class="pay_fee${list.imp_uid}"></span></li>
                                <li class="d-flex align-items-center justify-content-between refund-li">
                                                                                 포인트 사용 금액(P)<span class="use_point${list.imp_uid}"></span></li>
                                <div class="section-block"></div>
                                <li class="d-flex align-items-center justify-content-between refund-li">
                                                                                 취소 수수료(원)<span class="">0</span></li>
                                <div class="section-block"></div>
                                <li class="d-flex align-items-center justify-content-between refund-li">
                                                                                환불 금액(원) <span class="pay_fee${list.imp_uid}"></span></li>
                                <li class="d-flex align-items-center justify-content-between refund-li">
                                                                                 환불 포인트(P)<span class="use_point${list.imp_uid}"></span></li>
                                <li class="d-flex align-items-center justify-content-between refund-li">
                                                                                 적립된  포인트 차감(P)<span class="save_point${list.imp_uid}"></span></li>
                            </ul>
                                </div>
                                <c:if test="${list.s_no eq '1'}">
                                <div class="modal-body" style="font-size:13px">
                                		※ 이용날짜 '3일 전'까지 환불 수수료가 부과되지 않습니다. <br/>
                                		<span style="color:#007bff" class="fourBefore${list.imp_uid}"></span>까지 취소 수수료 무료  <br/>
                                		<!-- 2022.10.25부터는 취소 수수료 전액 부담 -->
                                		<span style="color:#ff6b6b" class="threeBefore${list.imp_uid}"></span>부터는 취소 불가합니다.
                                </div>
                                </c:if>
                                <div class="modal-footer">
                                <c:if test="${list.s_no eq '1'}">
                                    <button type="button" class="bt_refund btn btn-primary" disabled="" onclick="cancelPay()">환불 요청</button>
                                    <button type="button" class="btn btn-secondary"
                                        data-dismiss="modal">취소하기</button>
                                </c:if>
                                 <c:if test="${list.s_no eq '2'}">
                                    <button type="button" class="theme-btn button-info border-0"
                                        data-dismiss="modal">확인</button>
                                 </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                  <!-- </form> -->
                    <!-- /////////////////////////// 환불 요청 버튼 닫기 ///////////////////////////// -->
						
						

					</div>
				</div>
			</div>
			<!-- end card-content-wrap -->
		</div>
		<!-- end card-item -->
	</div>
	<!-- end -->
</c:forEach>

<c:choose>
	<c:when test="${empty list}">
		<input type="hidden" id="check_result" value="false">
	</c:when>
	<c:otherwise>
		<input type="hidden" id="check_result" value="true">
	</c:otherwise>
</c:choose>

<script src="/js/comma-format.js"></script>
<script
	src="/js/refund.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script><!-- jQuery CDN --->