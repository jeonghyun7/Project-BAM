<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="card-carousel card-static">
	<c:if test="${not empty tourMap}">
		<c:forEach items="${tourMap}" var="tour">
			<div class="card-item">
					<div class="card-image">
						<a href="https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=${tour.title}" target="_blank" class="card-image-wrap">
						         <img src="${tour.img}" class="card__img" style="height:250px" alt="">
						</a>
					</div>
				<div class="card-content-wrap">
					<div class="card-content">
						<h4 class="card-title">
							${tour.title} <i class="fa fa-check-circle" data-toggle="tooltip" data-placement="top" title="Claimed"></i>
						</h4>
						<p class="card-sub">${tour.addr}</p>
						<ul class="info-list padding-top-20px">
							<li><span class="la la-phone"></span> ${tour.tel}</li>
						</ul>
					</div>
				</div>
				<!-- end card-content-wrap -->
			</div>
		</c:forEach>
	</c:if>
</div>
 	<c:if test="${empty tourMap}">
		<div class="no-review-content padding-top-45px padding-bottom-30px">
			<span class="la la-car" style="margin-left:340px;font-size:60px;margin-bottom:10px;opacity:0.7"></span>
			<span style="margin-left:240px;font-size:18px;margin-bottom:50px"> 진행중인 주변 축제/박람회가 없습니다.</span>
		</div>
	</c:if>

<!-- end card-item -->
