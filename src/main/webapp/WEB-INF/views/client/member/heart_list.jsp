<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<c:if test="${page.currentPage == 1}">
	<input type="hidden" id="page-count" value="${page.pageCount}">
</c:if>
<c:forEach items="${hlist}" var="hlist" varStatus="index">
<div class="col-lg-4 column-td-6">
    <div class="card-item">
        <a href="../camp/camp_detail.bam?camp_idx=${hlist.camp_idx}" class="card-image-wrap">
            <div class="card-image">
                <img src="/images/camp-img/thumb/${hlist.fname}" class="card__img" style="height:250px">
            </div>
        </a>
        <div class="card-content-wrap">
            <div class="card-content">
                <a href="../camp/camp_detail.bam?camp_idx=${hlist.camp_idx}">
                    <h4 class="card-title mt-0">${hlist.camp_name}</h4>
                    <p class="card-sub">
                        <span class="la la-map-marker"></span>${hlist.address}
                    </p>
                </a>
            </div>
            <div class="rating-row">
                <div class="edit-info-box">
                    

                    <!-- /////////////////////////// 찜 목록 삭제 버튼 열기 ///////////////////////////// -->
                    <!-- Button trigger modal -->
                    <button type="button" class="theme-btn border-0"
                        data-toggle="modal" data-target="#exampleModal${hlist.heart_idx}" id="#modal_show${hlist.heart_idx}" href="#modal_show${hlist.heart_idx}">
                        <span class="la la-trash"></span> 삭제
                    </button>

                   <form method="post" id="form${hlist.camp_idx}" action="delete_heart.bam">
                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal${hlist.heart_idx}" tabindex="-1"
                        role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">찜 목록
                                        삭제</h5>
                                    <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
								<input type="hidden" name="camp_idx" value="${hlist.camp_idx}">
								<input type="hidden" name="email" value="${member.email}">
								
                                <div class="modal-body" align='center'>
                                    <a href="../camp/camp_detail.bam?camp_idx=${hlist.camp_idx}" class="card-image-wrap">
                                        <div class="card-image">
                                            <img src="/images/camp-img/thumb/${hlist.fname}" class="card__img" alt="">
                                        </div>
                                    </a>
                                    <div class="card-content">
                                        <a href="listing-details.html">
                                            <h4 class="card-title mt-0">${hlist.camp_name}</h4>
                                            <p class="card-sub">
                                                <span class="la la-map-marker"></span>${hlist.address}
                                            </p>
                                        </a>
                                    </div>
                                    [ ${hlist.camp_name} ]을 찜 목록에서 삭제하시겠습니까?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" onclick="submit_delete(${hlist.camp_idx});">삭제하기</button>
                                    <button type="button" class="btn btn-secondary"
                                        data-dismiss="modal">취소하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                  </form>
                    <!-- /////////////////////////// 찜 목록 삭제 버튼 닫기 ///////////////////////////// -->

                </div>
            </div>
        </div>
        <!-- end card-content-wrap -->
    </div>
    <!-- end card-item -->
</div>
</c:forEach>

<c:choose>
	<c:when test="${empty hlist}">
<input type="hidden" id="heart_check_result" value="false">
	</c:when>
	<c:otherwise>
<input type="hidden" id="heart_check_result" value="true">
	</c:otherwise>
</c:choose>
