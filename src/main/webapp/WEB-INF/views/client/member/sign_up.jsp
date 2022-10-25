<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
::-webkit-scrollbar {
	width: 6px;
}

::-webkit-scrollbar-track {
	background-color: transparent;
}

::-webkit-scrollbar-thumb {
	border-radius: 3px;
	background-color: gray;
}

::-webkit-scrollbar-button {
	width: 0;
	height: 0;
}

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
						<h2 class="breadcrumb__title">회원 가입</h2>
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
						<h3 class="widget-title font-size-28 pb-0">Create New Account!</h3>
						<p class="font-size-16 font-weight-medium">불밤야밤과 함께 즐거운 캠핑
							생활을 즐겨 보세요!</p>
					</div>
					<!-- billing-title-wrap -->
					<div class="billing-content">
						<div class="contact-form-action">
							<form id="sign-up-form" method="post" action="sign_up.bam">
								<div class="row">
									<div class="col-lg-12">
										<div class="input-box" style="margin-bottom: 15px;">
											<label class="label-text" style="margin-left: 15px;">이메일</label>
											<div class="input-group">
												<input id="realemail" type="email" name="realemail"
													placeholder="이메일을 입력해 주세요" class="form-control input-check-email"
													style="left: 15px; padding-left: 15px;"> 
												<input type="button" id="check" class="theme-btn border-0"
													style="margin-left: 20px; margin-right: 15px;"
													value="중복 확인">
											</div>
											<div class="alert alert-danger" id="result-check"
											style="display: block; margin-left: 15px; margin-right: 15px; margin-top: 15px; padding-top: 10px; padding-bottom: 10px;"></div>
											<div class="alert alert-success" id="email-check"
												style="display: block; margin-left: 15px; margin-right: 15px; margin-top: 15px; padding-top: 10px; padding-bottom: 10px;"></div>
										</div>
									</div>
								</div>
								<!-- end col-lg-12 -->
								<div class="col-lg-12">
									<div class="input-box">
										<label class="label-text">이름</label>
										<div class="form-group">
											<span class="la la-user form-icon"></span> <input
												class="form-control" type="text" id="name" name="name"
												placeholder="이름을 입력해 주세요" required maxlength="6">
										</div>
									</div>
								</div>
								<!-- end col-lg-12 -->
								<div class="col-lg-12">
									<div class="input-box">
										<label class="label-text">닉네임</label>
										<div class="form-group">
											<span class="la la-user form-icon"></span> <input
												class="form-control" type="text" id="nickname"
												name="nickname" placeholder="닉네임을 입력해 주세요" required maxlength="6">
										</div>
									</div>
								</div>
								<!-- end col-lg-12 -->
								<div class="col-lg-12">
									<div class="input-box">
										<label class="label-text">비밀번호 </label>
										<div class="form-group">
											<span class="la la-lock form-icon"></span> <input
												class="form-control" id="pwd" type="password" name="pwd"
												placeholder="비밀번호를 입력해 주세요 (숫자, 영문자, 특수문자 포함 8자 이상)"
												maxlength="20" required>
										</div>
										<div class="alert alert-danger" id="pwd-danger">비밀번호는
											8자리 이상의 문자, 숫자, 특수문자로 구성하여야 합니다.</div>
									</div>
								</div>
								<!-- end col-lg-12 -->
								<div class="col-lg-12">
									<div class="input-box">
										<label class="label-text">비밀번호 확인</label>
										<div class="form-group">
											<span class="la la-lock form-icon"></span> <input
												class="form-control" id="pwdCheck" type="password"
												name="pwdCheck" placeholder="비밀번호를 입력해 주세요" required>
										</div>
										<div class="alert alert-success" id="alert-success">비밀번호가
											일치합니다.</div>
										<div class="alert alert-danger" id="alert-danger">비밀번호가
											일치하지 않습니다.</div>
									</div>
								</div>
								<!-- end col-lg-12 -->
								<div class="col-lg-12">
										<div class="custom-checkbox d-block mr-0">
											<input type="checkbox" id="chb13" onclick="checked_box(this);" value="13">
											<label for="chb13" class="d-flex align-items-center justify-content-between">개인정보 수집 이용에 동의합니다. 
												<a role="button" id="aid"
												data-toggle="collapse" class="color-text">보기</a>
											</label>
											<div id="demo" class="collapse">
												<div id="textfile" class="card card-body"
													style="overflow: scroll; height: 200px;"></div>
											</div>
										</div>
										<!-- end custom-checkbox -->


										<div class="custom-checkbox d-block mr-0">
											<input type="checkbox" id="chb14" onclick="checked_box(this);" value="14" checked="false"> <label for="chb14"
												class="d-flex align-items-center justify-content-between">서비스
												이용 약관에 동의합니다. 
												<a role="button" id="aid2"
												data-toggle="collapse" class="color-text"
												>보기</a>
											</label>
											<div id="demo2" class="collapse">
												<div id="textfile2" class="card card-body"
													style="overflow: scroll; height: 200px;"></div>
											</div>

										</div>
										<!-- end custom-checkbox -->
									<!-- </div> -->
								</div>
								<!-- end col-lg-12 -->
								<div class="col-lg-12">
									<div class="btn-box margin-top-20px margin-bottom-20px">
										<button class="theme-btn border-0 w-100" id="sign-up-btn" style="background-color:#b0b0b0;"
											type="button" onclick="submit_form();" disabled>회원가입</button>
									</div>
								</div>
								<!-- end col-lg-12 -->
							</form>
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
<!-- 
start back-to-top -->
<div id="back-to-top">
	<i class="fa fa-angle-up" title="Go top"></i>
</div>
<!-- end back-to-top
 -->
<script src="/js/custom-signup.js"></script>
<script>
	$(document).ready(function(e) {
		var idx = false;
		$('#sign-up').click(function() {
			if ($.trim($('#email').val()) == '') {
				alert("아이디 입력.");
				$('#email').focus();
				return;
			} else if ($.trim($('#pwd').val()) == '') {
				alert("패스워드 입력.");
				$('#pwd').focus();
				return;
			}
			if (idx == false) {
				alert("아이디 중복체크를 해주세요.");
				return;
			} else {
				$('#sign-up-form').submit();
			}
		});
		
		var checkboxes = document.getElementsByTagName('input');

		for (var i=0; i<checkboxes.length; i++)  {
		  if (checkboxes[i].type == 'checkbox')   {
		    checkboxes[i].checked = false;
		  }
		}
	});
</script>
