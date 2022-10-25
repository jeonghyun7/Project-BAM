<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Table -->
<table class="table table-sm table-hover">
  <thead>
    <tr>
      <th scope="col">NO</th>
      <th scope="col">이메일</th>
      <th scope="col">제목</th>
      <th scope="col">작성일</th>
      <th scope="col">비고</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list}" var="inquiry"  varStatus="status">
  	<c:if test="${empty search}">
	    <tr id="${inquiry.inq_idx}" class="click-table-row" onclick=" row_click(this, '${page.currentPage}', false);">
		  <th scope="row">
			<c:out value="${status.count}"></c:out>
		  </th>
	      <td>${inquiry.email}</td>
	      <td>${inquiry.title}</td>
	      <td>${inquiry.wdate}</td>
	      <td>${inquiry.s_name}</td>
	    </tr>
  	</c:if>
  	<c:if test="${!empty search}">
	    <tr id="${inquiry.inq_idx}" class="click-table-row" onclick=" row_click(this, '${page.currentPage}', true);">
		  <th scope="row">
		  	<c:out value="${status.count}"></c:out>
		  </th>
	      <td>${inquiry.email}</td>
	      <td>${inquiry.title}</td>
	      <td>${inquiry.wdate}</td>
	      <td>${inquiry.s_name}</td>
	    </tr>
  	</c:if>
    </c:forEach>
    <c:if test="${empty list}">
    	<tr>
    		<td colspan="5" style="text-align:center">데이터가 없습니다</td>
    	</tr>
    </c:if>
  </tbody>
</table>
<c:if test="${!empty list}">
<c:if test="${empty search}">
<!-- Pagination -->
<nav aria-label="...">
  <ul class="pagination justify-content-center">
 	<c:choose>
 		<c:when test="${page.startPage eq 1}">
			<li class="page-item disabled">
		      <a class="page-link">이전</a>
		    </li>
 		</c:when>
 		<c:otherwise>
			<li class="page-item">
		      <a class="page-link" onclick="getInquiryList(${page.startPage-1});">이전</a>
		    </li>
 		</c:otherwise>
 	</c:choose>
 	
 	
  	<c:forEach begin="${page.startPage}" end="${page.endPage}" step="1" varStatus="status">
  		<c:choose>
  			<c:when test="${page.currentPage eq status.index}">
			    <li class="page-item active">
			      <a class="page-link" onclick="getInquiryList(${status.index});">${status.index}<span class="sr-only">(current)</span></a>
			    </li>
  			</c:when>
  			<c:otherwise>
			    <li class="page-item"><a class="page-link" onclick="getInquiryList(${status.index});">${status.index}</a></li>
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
		      <a class="page-link" onclick="getInquiryList(${page.endPage+1});">다음</a>
		    </li>
 		</c:otherwise>
 	</c:choose>
  </ul>
</nav>
</c:if>

<c:if test="${!empty search}">
<!-- Pagination -->
<nav aria-label="...">
  <ul class="pagination justify-content-center">
 	<c:choose>
 		<c:when test="${page.startPage eq 1}">
			<li class="page-item disabled">
		      <a class="page-link">이전</a>
		    </li>
 		</c:when>
 		<c:otherwise>
			<li class="page-item">
		      <a class="page-link" onclick="search_word(${page.startPage-1});">이전</a>
		    </li>
 		</c:otherwise>
 	</c:choose>
 	
 	
  	<c:forEach begin="${page.startPage}" end="${page.endPage}" step="1" varStatus="status">
  		<c:choose>
  			<c:when test="${page.currentPage eq status.index}">
			    <li class="page-item active">
			      <a class="page-link" onclick="search_word(${status.index});">${status.index}<span class="sr-only">(current)</span></a>
			    </li>
  			</c:when>
  			<c:otherwise>
			    <li class="page-item"><a class="page-link" onclick="search_word(${status.index});">${status.index}</a></li>
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
		      <a class="page-link" onclick="search_word(${page.endPage+1});">다음</a>
		    </li>
 		</c:otherwise>
 	</c:choose>
  </ul>
</nav>
</c:if>
</c:if>