<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

          <c:forEach items="${vo.list}" var="list">
             <div class="list-grid-container" name="${list.camp_idx}">
             <div class="list-campPic" onclick="clickCamp('${list.camp_idx}','${checkIn}','${checkOut}','${peopleNum}','${list.fname}')">
                 <div class="list-campPic-Wrap">
                    <img class="campPic" src="/images/camp-img/thumb/${list.fname}">
                 </div>
              </div>
              <div class="list-campInform">
                <div class="list-campType" onclick="location.href='../camp/camp_detail.bam?camp_idx=${list.camp_idx}&checkIn=${param.checkIn}&checkOut=${param.checkOut}&peopleNum=${param.peopleNum}'">
                <c:set var="fullAddr" value="${list.address}"/> 
                       <span class="location">${fn:substring(fullAddr, 0, 2)}</span> 지역의 <span class="type">캠핑장</span>
                        <input class="testAddr" type="hidden" value="${list.address}">
                        <input class="testLink" type="hidden" value="${list.camp_idx}">
                </div>
                <div class="list-campJJim">
                 <button class="heart" id="heart-${list.camp_idx}" style="display:inline;text-decoration:none;border:none;color:gray;background-color:transparent;"onclick="fillHeart(this)">
                   <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                  </svg>
               </button>
                 <button class="clickedHeart" id="emptyHeart-${list.camp_idx}" style="display:none;text-decoration:none;border:none;" onclick="emptyHeart(this)">
                   <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart-fill" fill="#ff6b6b" xmlns="http://www.w3.org/2000/svg">
                   <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/></svg>
               </button>
                </div>
                <div class="list-campName" onclick="location.href='../camp/camp_detail.bam?camp_idx=${list.camp_idx}&checkIn=${param.checkIn}&checkOut=${param.checkOut}&peopleNum=${param.peopleNum}'">
                   <h3 class="card-title">${list.camp_name}
                         <i class="fa fa-check-circle" data-toggle="tooltip" data-placement="top" title="안전 캠핑 인증"></i>
                      </h3>   
                </div>
                <div class="list-decoBar" onclick="location.href='../camp/camp_detail.bam?camp_idx=${list.camp_idx}&checkIn=${param.checkIn}&checkOut=${param.checkOut}&peopleNum=${param.peopleNum}'">
                     <hr style="border:0; height:1px; width:3rem; background-color:#cacaca;">
                </div>
                <div class="list-campMoreInform" onclick="location.href='../camp/camp_detail.bam?camp_idx=${list.camp_idx}&checkIn=${param.checkIn}&checkOut=${param.checkOut}&peopleNum=${param.peopleNum}'">
                    ${list.intro}
                </div>
                <div class="list-campRating" onclick="location.href='../camp/camp_detail.bam?camp_idx=${list.camp_idx}&checkIn=${param.checkIn}&checkOut=${param.checkOut}&peopleNum=${param.peopleNum}'">
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
                <div class="list-campCharge" onclick="location.href='../camp/camp_detail.bam?camp_idx=${list.camp_idx}&checkIn=${param.checkIn}&checkOut=${param.checkOut}&peopleNum=${param.peopleNum}'">
                   <span>₩</span><span class="charge">${list.min_fee}</span><span style="font-weight: 300 !important;">/1박</span>
                </div>
              </div>
            </div>
            
            <div class="list-under-decoBar">
               <hr style="border:1px;width:56.25rem;background-color:#9d9a9a;height:1px;">
            </div>
   </c:forEach>

<!-- 정현수정 -->
<script>
   function clickCamp(camp_idx, checkIn, checkOut, peopleNum, thumb){
      localStorage.setItem('thumb', thumb);
      location.href="../camp/camp_detail.bam?camp_idx="+camp_idx+"&checkIn="+checkIn+"&checkOut="+checkOut+"&peopleNum="+peopleNum;
   }
</script>