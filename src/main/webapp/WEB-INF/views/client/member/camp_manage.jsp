<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />



	<table class="table">
		<thead>
			<tr style="text-align: center">
				<th scope="col">NO</th>
				<th scope="col">상태</th>
				<th scope="col">이름 (이메일)</th>
				<th scope="col">체크인 / 체크아웃</th>
				<th scope="col">캠핑장 종류</th>
				<th scope="col">전화번호</th>
				<th scope="col">총 인원수</th>
				<th scope="col">메모</th>
				<th scope="col">결제 상태</th>
				<th scope="col">이용 여부</th>
			</tr>
		</thead>
		<tbody style="text-align: center">
		<c:forEach items="${list}" var="list" varStatus="index">
			<tr>
				<th scope="row" style="padding-top: 25px;">
					<c:out value="${index.count}"></c:out>
				</th>
				
				<c:choose>
					<c:when test="${list.using_state == 'F'}">
						<td style="padding-top: 25px; color:#3c823d; cursor:default;">이용 전</td>
					</c:when>
					<c:when test="${list.using_state == 'U'}">
						<td style="padding-top: 25px; color:#e0583d; cursor:default;">이용 중</td>
					</c:when>
					<c:otherwise>
						<td style="padding-top: 25px; color:#2e71f0; cursor:default;">이용 완료</td>
					</c:otherwise>
				</c:choose>
				
				<td>${list.name}<br />${list.email}
				</td>
				<td>${list.check_in}<br />${list.check_out}
				</td>
				<td>${list.sort_name}<br />${list.site_name}
				</td>
				<td style="padding-top: 25px;">${list.tel}</td>
				<td style="padding-top: 25px;">${list.p_num}</td>
				<td><button class="btn btn-outline-dark"
						data-toggle="modal" style="padding-top: 10px;padding-bottom: 10px;" data-target="#exampleModal${index.index}">click</button></td>

				<td><button class="btn btn-outline-primary" style="padding-top: 10px;padding-bottom: 10px; cursor:default;" disabled>결제
						완료</button></td>
				<c:choose>
					<c:when test="${list.using_state == 'F'}">
						<td><button class="btn btn-outline-success" style="padding-top: 10px;padding-bottom: 10px;" onclick="change_using_state('${list.imp_uid}', 'start', '${page.currentPage}');">이용 시작</button></td>
					
					</c:when>
					<c:when test="${list.using_state == 'U'}">
						<td><button class="btn btn-outline-success" style="padding-top: 10px;padding-bottom: 10px;" onclick="change_using_state('${list.imp_uid}', 'end','${page.currentPage}');">이용 완료</button></td>
					
					</c:when>
					<c:otherwise>
						<td><button class="btn btn-outline-success" style="padding-top: 10px;padding-bottom: 10px; cursor:default;" disabled>완료</button></td>
					
					</c:otherwise>
				</c:choose>
			</tr>
			<div class="modal fade" id="exampleModal${index.index}" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel${index.index}" aria-hidden="true">
				<input type="hidden" id="1">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel${index.index}">이용자 메모</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<article>
								<div class="container" role="main">
									<pre><c:out escapeXml="true" value="${list.memo}" default="no memo"></c:out></pre>
								</div>
							</article>
						</div>
						<div class="modal-footer">
							<button type="button" class="theme-btn border-0"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<c:if test="${empty list}">
			<th style="text-align:center" colspan="10">검색된 예약 내역이 없습니다.</th>
		</c:if>
		</tbody>
	</table>
		<table class="table">
		<thead>
		<tr style="text-align: center">
		<th scope="col">총 사이트수</th>
		<th scope="col">현재 사용 중</th>
		<th scope="col">체크인 대기</th>
		<th scope="col">체크아웃 완료</th>
		</tr>
		</thead>
		<tbody>
		<tr style="text-align:center">
			<td>${campSize}</td>
			<td>${using}</td>
			<td>${notUsing}</td>
			<td>${endUsing}</td>
		</tr>
		</tbody>
	</table>
	<c:choose>
	<c:when test="${empty list}">
	</c:when>
	<c:otherwise>
	<div style="text-align:center">
		<nav aria-label="...">
		  <ul class="pagination justify-content-center" id="pagination">
		 	<c:choose>
		 		<c:when test="${page.startPage eq 1}">
					<li class="page-item disabled">
				      <a class="page-link">이전</a>
				    </li>
		 		</c:when>
		 		<c:otherwise>
					<li class="page-item">
				      <a class="page-link" onclick="start_camp_manage(true, true, true, '${page.startPage-1}')">이전</a>
				    </li>
		 		</c:otherwise>
		 	</c:choose>
		 	
		 	
		  	<c:forEach begin="${page.startPage}" end="${page.endPage}" step="1" varStatus="status">
		  		<c:choose>
		  			<c:when test="${page.currentPage eq status.index}">
					    <li class="page-item active">
					      <a class="page-link" onclick="start_camp_manage(true, true, true, '${status.index}')">${status.index}<span class="sr-only">(current)</span></a>
					    </li>
		  			</c:when>
		  			<c:otherwise>
					    <li class="page-item"><a class="page-link" onclick="start_camp_manage(true, true, true,'${status.index}')">${status.index}</a></li>
		  			</c:otherwise>
		  		</c:choose>
		  	</c:forEach>
		  	
		 	<c:choose>
		 		<c:when test="${page.endPage eq page.pageCount}">
		 			<li class="page-item disabled">
				      <a class="page-link">다음</a>
				    </li>		
		 		</c:when>
		 		<c:otherwise>
		 		    <li class="page-item">
				      <a class="page-link" onclick="start_camp_manage(true, true, true, '${page.endPage+1}')">다음</a>
				    </li>
		 		</c:otherwise>
		 	</c:choose>
		  </ul>
		</nav>
	</div>
	</c:otherwise>
	</c:choose>
