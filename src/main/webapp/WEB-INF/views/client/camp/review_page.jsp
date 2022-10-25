<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${reviewVo.reviewList}" var="reviewList">
	<div class="comment">
		<div class="comment-body">
			<div class="meta-data test-star">
				<span class="comment__author ">${reviewList.nickname} <c:forEach
						begin="1" end="${reviewList.fullStarNum}">
						<span class="la la-star"></span>
					</c:forEach> <c:if test="${reviewList.halfStarExist}">
						<span class="la la-star-half-full"></span>
					</c:if> <c:forEach begin="1" end="${reviewList.emptyStarNum}" step="1">
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
						<span class="comment__date">${reviewList.diffDays}일 전 </span>
					</c:otherwise>
				</c:choose>
			</div>
			<p class="comment-content">${reviewList.content}</p>
		</div>
	</div>
	<!-- end 리뷰댓글 -->
</c:forEach>
