<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- /////////////////////////// 유저 오른쪽 정보 ///////////////////////////// -->

<!-- /////////////////////////// 유저 오른쪽 정보 ///////////////////////////// -->
<div>
	<div class="user-form-action">
		<div class="billing-form-item">
			<div class="billing-title-wrap">
				<h3 class="widget-title pb-0">${member.name}님의 캠핑장 정보</h3>
				<div class="title-shape margin-top-10px"></div>
			</div>
			<!-- billing-title-wrap -->
			<div class="billing-content">
				<div id="test123" class="contact-form-action">
					<form method="post">
						<div class="gallery-carousel padding-top-35px padding-bottom-40px">
							<c:forEach items="${vo.img_list}" var="img">
								<div
									data-dot="<img src='/images/camp-img/detail/${img.fname}' style='height:80px'>"
									class="gallery-item">
									<img src="/images/camp-img/detail/${img.fname}"
										alt="gallery-image" style='height: 450px'>
								</div>
							</c:forEach>
						</div>
						<!-- end gallery-carousel -->
						<div class="input-box">
							<label class="label-text">캠핑장 이름 </label>
							<div class="form-group">

								<input class="form-control" type="text" name="camp_name"
									value="${vo.camp.camp_name}" readonly>
							</div>
						</div>
						<div class="input-box">
							<label class="label-text">캠핑장 주소 </label>
							<div class="form-group">

								<input class="form-control" type="text" name="address"
									value="${vo.camp.address}" readonly>
							</div>
						</div>
						<div class="input-box">
							<label class="label-text">전화번호 </label>
							<div class="form-group">

								<input class="form-control" type="text" name="camp_tel"
									value="${vo.camp.camp_tel}" readonly>
							</div>
						</div>
						<div class="input-box">
							<label class="label-text">이메일 주소 </label>
							<div class="form-group">

								<input class="form-control" type="text" name="email"
									value="${vo.owner.email}" readonly>
							</div>
						</div>
						<div class="input-box">
							<label class="label-text">찜 </label>
							<div class="form-group">

								<input class="form-control" type="text" name="heart"
									value="+ ${vo.total_heart}" readonly>
							</div>
						</div>
					</form>
				</div>
				<!-- end contact-form-action -->
			</div>
			<!-- end billing-content -->
		</div>
		<div class="billing-form-item">
			<div class="billing-title-wrap">
				<h3 class="widget-title pb-0">캠핑장 분류</h3>
				<div class="title-shape margin-top-10px"></div>
			</div>
			<!-- billing-title-wrap -->
			<div class="billing-content">
				<div id="test123" class="contact-form-action">
					<form method="post">
						<c:forEach items="${vo.sort_list}" var="sort" varStatus="status">
							<div class="input-box">
								<label class="label-text">분류 이름 </label>
								<div class="form-group">

									<input class="form-control" type="text" name="camp_name"
										value="${sort.sort_name}" readonly>
								</div>
							</div>
							<img src="/images/camp-img/sort/${sort.fname}"
								alt="gallery-image"
								style='height: 450px; width: 707px; margin-bottom: 20px'>
							<!-- end gallery-carousel -->
							<div class="input-box">
								<label class="label-text">구역 이름 </label>
								<div class="form-group">

									<input class="form-control" type="text" name="address"
										value="${sort.site_name}" readonly>
								</div>
							</div>
							<div class="input-box">
								<label class="label-text">수용인원 </label>
								<div class="form-group">

									<input class="form-control" type="text" name="camp_tel"
										value="${sort.people_num} 명" readonly>
								</div>
							</div>
							<div class="input-box">
								<label class="label-text">가격 </label>
								<div class="form-group">

									<input class="form-control" type="text" name="email"
										value="${sort.site_fee} 원" readonly>
								</div>
							</div>
							<c:if test="${!status.last}">
								<div class="section-block"
									style="margin-top: 40px; margin-bottom: 30px; height: 1px; background-color: #bfbdbd"></div>
							</c:if>
						</c:forEach>
					</form>
				</div>
				<!-- end contact-form-action -->
			</div>
			<!-- end billing-content -->
		</div>
		<!-- -------------------START SITES-------------------[ -->
	</div>
	<!-- end user-form-action -->
	<!-- -------------------END SITES-------------------[ -->

	<div class="delete-account-info">
		<div class="billing-form-item">
			<div class="billing-title-wrap">
				<h3 class="widget-title pb-0 color-text">캠핑장 수정 및 삭제</h3>
				<div class="title-shape margin-top-10px"></div>
			</div>
			<!-- billing-title-wrap -->
			<div class="delete-info-content p-4">
				<p class="mb-3">
					<span class="text-warning">주의</span> 캠핑장 삭제와 동시에 캠핑장과 관련된 모든 정보는
					말소됩니다.
				</p>
				<div style="text-align: right">

					<div class="btn-box" style="text-align: right">
						<a type="button" class="theme-btn button-success border-0" href="../owner/update_camp.bam">수정</a>

						<button class="theme-btn border-0 " data-toggle="modal"
							data-target="#delete_modal">삭제</button>
					</div>

					<!-- Modal -->
					<div class="modal fade" id="delete_modal"
						tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">캠핑장 삭제</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body" align='center'>
									<a href="../search/camp_detail.bam?camp_idx="
										class="card-image-wrap">
										<div class="card-image">
											<img src="/images/camp-img/thumb/${vo.thumb_img.fname}"
												class="card__img" alt="">
										</div>
									</a>
									<div class="card-content">
										<a href="listing-details.html">
											<h4 class="card-title mt-0"></h4>
											<p class="card-sub">
												<span class="la la-map-marker">${vo.camp.address}</span>
											</p>
										</a>
									</div>
									[${vo.camp.camp_name}]을 삭제하시겠습니까?
								</div>
								<div class="modal-footer">
									<form method="post" action="../owner/delete_camp.bam">
										<input type="hidden" name="camp_idx" value="${vo.camp.camp_idx}">
										<button type="submit" class="btn btn-primary">삭제하기</button>
									</form>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소하기</button>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- end delete-info-content -->
		</div>
	</div>
	<!-- end delete-account-info -->
</div>
<!-- end col-lg-8 -->
</div>