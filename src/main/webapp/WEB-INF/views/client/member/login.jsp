<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	

<!DOCTYPE html>
<html lang="en">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../vendor/js/common/naveridlogin_js_sdk_2.0.0.js"></script>

<style>
body {
	font-family: 'Varela Round', sans-serif;
}

.modal-login {
	width: 500px;
	margin: 30px auto;
}

.modal-login .modal-content {
	padding: 20px;
	border-radius: 5px;
	border: none;
}

.modal-login .modal-header {
	border-bottom: none;
	position: relative;
	justify-content: center;
}

.modal-login .close {
	position: absolute;
	top: -10px;
	right: -10px;
}

.modal-login h4 {
	color: #636363;
	text-align: center;
	font-size: 26px;
	margin-top: 0;
}

.modal-login .modal-content {
	color: #999;
	border-radius: 1px;
	margin-bottom: 15px;
	background: #fff;
	border: 1px solid #f3f3f3;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 25px;
}

.modal-login .form-group {
	margin-bottom: 20px;
}

.modal-login label {
	font-weight: normal;
	font-size: 13px;
}

.modal-login .form-control {
	min-height: 38px;
	padding-left: 5px;
	box-shadow: none !important;
	border-width: 0 0 1px 0;
	border-radius: 0;
}

.modal-login .form-control:focus {
	border-color: #ccc;
}

.modal-login .input-group-addon {
	max-width: 42px;
	text-align: center;
	background: none;
	border-width: 0 0 1px 0;
	padding-left: 5px;
	border-radius: 0;
}

.modal-login .btn {
	font-size: 16px;
	font-weight: bold;
	background: #19aa8d;
	border-radius: 3px;
	border: none;
	min-width: 140px;
	outline: none !important;
}

.modal-login .btn:hover, .modal-login .btn:focus {
	background: #179b81;
}

.modal-login .hint-text {
	text-align: center;
	padding-top: 5px;
	font-size: 13px;
}

.modal-login .modal-footer {
	color: #999;
	border-color: #dee4e7;
	text-align: center;
	margin: 0 -25px -25px;
	font-size: 13px;
	justify-content: center;
}

.modal-login a {
	color: #fff;
	text-decoration: underline;
}

.modal-login a:hover {
	text-decoration: none;
}

.modal-login a {
	color: #19aa8d;
	text-decoration: none;
}

.modal-login a:hover {
	text-decoration: underline;
}

.modal-login .fa {
	font-size: 21px;
}

.trigger-btn {
	display: inline-block;
	margin: 100px auto;
}
</style>

<!-- start per-loader -->
<div class="loader-container">
	<div class="loader-ripple">
		<div></div>
		<div></div>
	</div>
</div>
<!-- end per-loader -->



<!-- ================================
    START BREADCRUMB AREA
================================= -->
<section class="breadcrumb-area">
	<div class="breadcrumb-wrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-content">
						<h2 class="breadcrumb__title">로그인</h2>
					</div>
					<!-- end breadcrumb-content -->
				</div>
				<!-- end col-lg-12 -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</div>
	<!-- end breadcrumb-wrap -->
	<!-- <div class="bread-svg">
		<svg viewBox="0 0 500 150" preserveAspectRatio="none">
            <path
				d="M-4.22,89.30 C280.19,26.14 324.21,125.81 511.00,41.94 L500.00,150.00 L0.00,150.00 Z"></path>
        </svg>
	</div> -->
	<!-- end bread-svg -->
</section>
<!-- end breadcrumb-area -->
<!-- ================================
    END BREADCRUMB AREA
================================= -->

<!-- ================================
       START FORM AREA
================================= -->
<section class="form-shared padding-top-40px padding-bottom-100px">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 mx-auto">
				<div class="billing-form-item mb-0">
					<div
						class="billing-title-wrap border-bottom-0 pr-0 pl-0 pb-0 text-center">
						<h3 class="widget-title font-size-28 pb-0">Login to your
							Account</h3>

					</div>
					<!-- billing-title-wrap -->
					<div class="billing-content">
						<div class="contact-form-action">
							<form method="post" action="login_user.bam">
								<div class="row">
									<div class="col text-center">
										<p class="font-size-16 font-weight-medium">네이버 아이디가
											있으신가요?</p>
										
										<div style="text-align:center">
											<a href="${naver_url}"><img width="223" src="${pageContext.request.contextPath}/resources/images/Naver_Login_Button_White.PNG"></a>
										</div>
									</div>
									
									<div class="col-lg-12">
										<div class="account-assist mt-4 mb-4 text-center">
											<p class="account__desc">or</p>
										</div>
									</div>
									<!-- end col-lg-12 -->
									<div class="col-lg-12">
										<div class="input-box">
											<label class="label-text">EMAIL</label>
											<div class="form-group">
												<span class="la la-user form-icon"></span> <input
													class="form-control" type="email" id="email2" name="email"
													placeholder="이메일을 입력해 주세요">
											</div>
										</div>
									</div>
									<!-- end col-lg-12 -->
									<div class="col-lg-12">
										<div class="input-box">
											<label class="label-text">Password</label>
											<div class="form-group">
												<span class="la la-lock form-icon"></span> <input
													class="form-control" type="password" name="pwd" id="pwd"
													placeholder="비밀번호를 입력해 주세요">
											</div>
										</div>
									</div>
									<!-- end col-lg-12 -->
									<div class="col-lg-12">
										<div class="form-group">
											<div
												class="custom-checkbox mr-0 d-flex align-items-center justify-content-between">
												<div>
													<input type="checkbox" id="chb1"> <label for="chb1">로그인
														상태 유지</label>
												</div>
 											</div>
										</div>
									</div> 
									<!-- end col-lg-12 -->
									<div class="col-lg-12">
										<div class="btn-box margin-top-20px margin-bottom-20px">
											<button class="theme-btn border-0 w-100" type="submit">로그인
												</button>
										</div>
									</div>
									<!-- end col-lg-12 -->
									<div class="col-lg-12">
										<p class="font-weight-medium">
											아직 불밤야밤 회원이 아니신가요? <a href="../sign_up/sign_up_page.bam"
												class="color-text" action="sign_up_page.bam"> 회원가입 </a>
										</p>
									</div>
									<!-- end col-lg-12 -->
									</form>
								</div>
													<!-- Button HTML (to Trigger Modal) -->
													<p class="font-weight-medium">
													비밀번호를 잊으셨나요? 
													<a href="#myModal" class="color-text font-weight-medium"
														data-toggle="modal" type="button">비밀번호 찾기 </a>

												<!-- Modal HTML -->
												<div id="myModal" class="modal fade">
													<div class="modal-dialog modal-login">
														<div class="modal-content">
															<div class="modal-header">
																<h4 class="modal-title">비밀번호 찾기</h4>

																<button type="button" class="close" data-dismiss="modal"
																	aria-hidden="true">&times;</button>
															</div>
															<div style="font-size: 12px; text-align: center">
																계정으로 사용하는 이메일 주소를 입력하시면, 비밀번호 재설정 링크를 전송해 드립니다.</div>
															<div class="modal-body">
																<form action="find_pwd.bam" method="post">
																	<div class="form-group">
																	
																		
																		<div class="input-group">

																			<span class="input-group-addon"></span> <input
																				type="email" class="form-control" id="email" name="email"
																				placeholder="Email">
																		</div>
																	</div>

																	<div class="form-group">
																		<button type="submit" class="theme-btn border-0 w-100"  id="find-pwd-btn">재설정
																			링크 전송하기</button>
																	</div>
																</form>
															</div>
															<div class="modal-footer">
																아직 불밤야밤 회원이 아니신가요? <a href="../sign_up/sign_up_page.bam"
																	class="color-text font-weight-medium" action="sign_up_page.bam">회원가입</a>
															</div>
														</div>
													</div>
												</div>
											</div>
											
								<!-- end row -->

						</div>
						
						<!-- end contact-form-action -->
					</div>
					<!-- end billing-content -->
				</div>
				<!-- end billing-form-item -->
			</div>
			<!-- end col-lg-6 -->
		</div>

		
												 
		<!-- end row -->
	<!-- end container -->
</section>

<!-- end form-shared -->
<!-- ================================
       START FORM AREA
================================= -->
