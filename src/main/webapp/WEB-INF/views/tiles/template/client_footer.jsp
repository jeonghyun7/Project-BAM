<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ================================
       START FOOTER AREA
================================= -->

<section id ="footer" class="footer-area section-bg padding-top-140px padding-bottom-60px">
    <!--  이거 왜있는 거 ?? -->
    <div class="box-icon"></div>
    <div class="box-icon"></div>
    <div class="box-icon"></div>
    <div class="box-icon"></div>
    <div class="box-icon"></div>
    <div class="box-icon"></div>
    
    <div class="container">
        <div class="row">
            <div class="col-lg-3 column-td-6">
                <div class="footer-item">
                    <div class="logo">
                        <a href="index.html" class="foot-logo"><img src="/images/asdad.png" alt="logo" width="40px"></a>
                        <p class="footer__desc">
                            불밤야밤 -- We provides camping reservation and We also offer camping information and community
                        </p>
                        <ul class="social-profile">
                            <li>
                                <a href="https://www.instagram.com/bulbam_yabam/">
                                    <i class="fa fa-facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="https://www.instagram.com/bulbam_yabam/">
                                    <i class="fa fa-twitter"></i>
                                </a>
                            </li>
                            <li>
                                <a href="https://www.instagram.com/bulbam_yabam/">
                                    <i class="fa fa-instagram"></i>
                                </a>
                            </li>

                        </ul>
                    </div><!-- end logo -->
                </div><!-- end footer-item -->
            </div><!-- end col-lg-3 -->
            <div class="col-lg-3 column-td-6">
                <div class="footer-item">
                    <h4 class="footer__title">Quick Links</h4>
                    <ul class="list-items">
                        <!-- <li><a href="/howto">사이트 활용법</a></li> -->
                        <c:if test="${ empty member }">
                        <li><a href="/sign_up/sign_up_page.bam">회원가입</a></li>
                        <li><a href="/login/login.bam">로그인</a></li>
                        </c:if>
                        <li><a href="/trust">신뢰와 안전</a></li>
                        <li><a href="/newsroom">뉴스룸</a></li>
                    </ul>
                </div><!-- end footer-item -->
            </div><!-- end col-lg-3 -->
            <div class="col-lg-3 column-td-6">
                <div class="footer-item">
                    <h4 class="footer__title">Categories</h4>
                    <ul class="list-items">
                        <li><a href="#">커뮤니티</a></li>
                        <li><a href="#">친구 초대하기</a></li>
                        <li><a href="/owner/add_camp.bam">캠핑장 등록</a></li>
                        <li><a href="#">채용 정보</a></li>
                        <li><a href="/owner/com_inquiry.bam">사업자 등록</a></li>
                    </ul>
                </div><!-- end footer-item -->
            </div><!-- end col-lg-3 -->
            <div class="col-lg-3 column-td-6">
                <div class="footer-item">
                    <h4 class="footer__title">Contact with Us</h4>
                    <ul class="info-list contact-links">
                        <li><span class="la la-home"></span> 대전 서구 대덕대로 182 10층</li>
                        <li><span class="la la-headphones"></span> <a href="#">+ 81 042 123 1234</a></li>
                        <li><span class="la la-envelope-o"></span> <a href="mailto:bulbamyabam@naver.com">bulbamyabam@naver.com</a></li>
                    </ul>
                </div><!-- end footer-item -->
            </div><!-- end col-lg-3 -->
        </div><!-- end row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="copy-right margin-top-50px padding-top-60px">
                    <p class="copy__desc">
                        &copy; Copyright 불밤야밤 2022. Made with<img src="/images/asdad.png" width="20px" height="20px" />
                        <span class="la la-heart-o"></span>by <a href="https://github.com/leedooil">DI</a>, <a href="https://github.com/create1475" >SJ</a>, <a href="https://github.com/jeonghyun7" >JH</a>, <a href="https://github.com/dzzcheld" >HS </a>
                    </p>
                    <ul class="list-items">
                        <li><a href="#">Terms & Conditions</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Help Center</a></li>
                    </ul>
                </div><!-- end copy-right -->
            </div><!-- end col-lg-12 -->
        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end footer-area -->
<!-- ================================
       START FOOTER AREA
================================= -->

<!-- start back-to-top -->
<div id="back-to-top">
    <i class="fa fa-angle-up" title="Go top"></i>
</div>
<!-- end back-to-top -->

<!-- Template JS Files -->
<script src="/js/browser-close.js?ver=<%=System.currentTimeMillis()%>"></script>
<script src="/js/jquery.min.js?ver=<%=System.currentTimeMillis()%>"></script>
<script src="/js/jquery-ui.js?ver=<%=System.currentTimeMillis()%>"></script>
<script src="/js/popper.min.js?ver=<%=System.currentTimeMillis()%>"></script>
<script src="/js/bootstrap.min.js?ver=<%=System.currentTimeMillis()%>"></script>
<script src="/js/owl.carousel.min.js?ver=<%=System.currentTimeMillis()%>"></script>
<script src="/js/jquery.magnific-popup.min.js?ver=<%=System.currentTimeMillis()%>"></script>
<script src="/js/isotope-3.0.6.min.js?ver=<%=System.currentTimeMillis()%>"></script>
<script src="/js/animated-headline.js?ver=<%=System.currentTimeMillis()%>"></script>
<script src="/js/select2.min.js?ver=<%=System.currentTimeMillis()%>"></script>
<script src="/js/moment.min.js?ver=<%=System.currentTimeMillis()%>"></script>
<script src="/js/daterangepicker.js?ver=<%=System.currentTimeMillis()%>"></script>
<script src="/js/waypoints.min.js?ver=<%=System.currentTimeMillis()%>"></script>
<script src="/js/jquery.counterup.min.js?ver=<%=System.currentTimeMillis()%>"></script>
<script src="/js/jquery.show-more.js?ver=<%=System.currentTimeMillis()%>"></script>
<script src="/js/jquery-rating.js?ver=<%=System.currentTimeMillis()%>"></script>
<script src="/js/jquery.filer.min.js?ver=<%=System.currentTimeMillis()%>"></script>
<script src="/js/smooth-scrolling.js?ver=<%=System.currentTimeMillis()%>"></script>
<script src="/js/main.js?ver=<%=System.currentTimeMillis()%>"></script>
