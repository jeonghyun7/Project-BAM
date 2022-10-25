<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- start per-loader -->
<div class="loader-container">
    <div class="loader-ripple">
        <div></div>
        <div></div>
    </div>
</div>
<!-- end per-loader -->

<!-- ================================
            START HEADER AREA
================================= -->
<header class="header-area">
    <div class="header-menu-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="menu-full-width">
                        <div class="logo">
                            <a href="${pageContext.request.contextPath}/"><img src="/images/asdad.png" alt="logo"></a>
                        </div><!-- end logo -->
						<div class="main-menu-content">
						</div>
                    	 <div class="logo-right-content" style="float:right !important">
                            <div class="side-user-menu-open" style="background-color:#ff6b6b !important">
                                <span class="la la-user" style="color:white !important ; width:48px !important"></span>
                            </div><!-- end side-user-menu-open -->
                      </div><!-- end logo-right-content -->
                    </div><!-- end menu-full-width -->               
                </div><!-- end col-lg-12 -->
            </div><!-- end row -->
        </div><!-- end container-fluid -->
    </div><!-- end header-menu-wrapper -->

	<div class="side-user-panel">
        <div class="humburger-menu">
            <div class="humburger-menu-lines side-menu-close"></div><!-- end humburger-menu-lines -->
        </div><!-- end humburger-menu -->
        <div class="side-menu-wrap side-user-menu-wrap">
            <div class="side-user-img">
                
                <h4 id="name" class="su__name">${member.name}</h4>

            </div>
            <c:if test="${member == null }">
            	<div>
            	<img src="/images/asdad.png" style="padding-left:15px">
            	</div>
            	</c:if>
            <ul class="side-menu-ul">
            	<c:if test="${member != null}">
                <li><a style="cursor:pointer" onclick="location.href='${pageContext.request.contextPath}/member/mypage.bam?selected=info'"><span class="la la-user user-icon"></span> 마이페이지</a></li>
                <li><a style="cursor:pointer" onclick="location.href='${pageContext.request.contextPath}/member/mypage.bam?selected=booking'"><span class="la la-list-alt user-icon"></span> 예약내역</a></li>
                <li><a style="cursor:pointer" onclick="location.href='${pageContext.request.contextPath}/member/mypage.bam?selected=heart'"><span class="la la-bookmark-o user-icon"></span> 찜 목록</a></li>
                <li><a style="cursor:pointer" onclick="location.href='${pageContext.request.contextPath}/owner/com_inquiry.bam'"><span class="la la-plus-circle user-icon"></span> 사업자 등록</a></li>
                </c:if>
                <c:if test="${member == null }">
                <li><a style="cursor:pointer" onclick="location.href='${pageContext.request.contextPath}/sign_up/sign_up_page.bam'"><span class="la la-user user-icon"></span> 회원가입 </a></li>
                <li><a style="cursor:pointer" onclick="location.href='${pageContext.request.contextPath}/login/login.bam'"><span class="la la-power-off user-icon"></span> 로그인 </a></li>
                </c:if>
                <c:if test="${member != null }">
                <c:choose>
                	<c:when test="${member.accessToken ne null}">
		                <li><a onclick="location.href='${pageContext.request.contextPath}/login/logout_naver?accessToken=${member.accessToken}'"><span class="la la-power-off user-icon"></span> 로그아웃</a></li>
                	</c:when>
                	<c:otherwise>
		                <li><a id="logout" onclick="location.href='${pageContext.request.contextPath}/login/logout.bam'"><span class="la la-power-off user-icon"></span> 로그아웃</a></li>
                	</c:otherwise>
                </c:choose>
                </c:if>
            </ul>
            <div class="side-user-search contact-form-action">
                <form method="post">
                    <div class="form-group mb-0">
                       
                    </div>
                    
                </form>
            </div><!-- end sidebar-widget -->
        </div><!-- end side-menu-wrap -->
    </div><!-- end side-user-panel -->

</header>
<!-- ================================
         END HEADER AREA
================================= -->

<script>

</script>
