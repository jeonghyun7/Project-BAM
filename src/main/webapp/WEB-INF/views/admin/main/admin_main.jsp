<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
   <div class="content-page">
		<!-- Start content -->
        <div class="content">
            
			<div class="container-fluid">
					
						<div class="row">
									<div class="col-xl-12">
											<div class="breadcrumb-holder">
													<h1 class="main-title float-left">Dashboard</h1>
													<ol class="breadcrumb float-right">
														<li class="breadcrumb-item">Home</li>
														<li class="breadcrumb-item active">Dashboard</li>
													</ol>
													<div class="clearfix"></div>
											</div>
									</div>
						</div>
						<!-- end row -->

							<div class="row">
									<div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
											<div class="card-box noradius noborder bg-default">
													<i class="fas fa-file-invoice float-right text-white"></i>
													<h6 class="text-white text-uppercase m-b-20">예약 수</h6>
													<h1 id="total-booking" class="m-b-20 text-white counter"></h1>
													<span id="total-current-booking" class="text-white">최근 예약 : 15</span>
											</div>
									</div>

									<div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
											<div class="card-box noradius noborder bg-warning">
													<i class="fas fa-campground float-right text-white"></i>
													<h6 class="text-white text-uppercase m-b-20">캠핑장 수</h6>
													<h1 id="total-camp" class="m-b-20 text-white counter"></h1>
													<span class="text-white">&nbsp;</span>
											</div>
									</div>

									<div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
											<div class="card-box noradius noborder bg-info">
													<i class="fas fa-users float-right text-white"></i>
													<h6 class="text-white text-uppercase m-b-20">현재 로그인 수</h6>
													<h1 id="total-login-member" class="m-b-20 text-white counter"></h1>
													<span class="text-white">&nbsp;</span>
											</div>
									</div>

									<div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
											<div class="card-box noradius noborder bg-danger">
													<i class="fas fa-envelope-open-text float-right text-white"></i>
													<h6 class="text-white text-uppercase m-b-20">문의 수</h6>
													<h1 id="total-inquiry" class="m-b-20 text-white counter"></h1>
													<span id="total-unchecked-inquiry" class="text-white">미처리 : </span>
											</div>
									</div>
							</div>
							<!-- end row -->


							
							<div class="row">
							
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-6">						
										<div class="card mb-3">
											<div class="card-header">
												<h3><i class="fa fa-bar-chart-o"></i> 매출액 비교</h3>
												어제와 오늘의 매출액 비교 <span style="font-size:13px; font-weight:bold;">매출 통계<a target="_blank" href="sales_camp_monthly.bam">&lt;자세히 보기&gt;</a></span>
											</div>
												
											<div class="card-body">
												<canvas id="lineChart"></canvas>
											</div>							
											<div class="card-footer small text-muted">업데이트 : <span id="line-update-date"></span></div>
										</div><!-- end card-->					
									</div>

									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-3">						
										<div class="card mb-3">
											<div class="card-header">
												<h3><i class="fa fa-bar-chart-o"></i> 회원</h3>
												<span style="font-size:13px; font-weight:bold;">회원 관리<a target="_blank" href="member_manage.bam">&lt;자세히 보기&gt;</a></span><br/>
												<span style="font-size:13px; font-weight:bold;">탈퇴 회원 관리<a style="font-size:5px" target="_blank" href="leave_member_manage.bam">&lt;자세히 보기&gt;</a></span>
											</div>
												
											<div class="card-body">
												<canvas id="pieChart"></canvas>
											</div>
											<div class="card-footer small text-muted">업데이트 : <span id="pie-update-date"></span></div>
										</div><!-- end card-->					
									</div>
									
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-3">						
										<div class="card mb-3">
											<div class="card-header">
												<h3><i class="fas fa-user-clock"></i> 로그인 회원</h3>
											</div>
												
											<div class="card-body">
												
												<div id="login-member" class="widget-messages nicescroll" style="height: 400px;">
												
																<a href="#">
																	<div class="message-item">
																		<p class="message-item-msg">로그인한 회원이 없습니다.</p>
																	</div>
																</a>
												 
												 </div>
												
											</div>
											<div class="card-footer small text-muted"></div>
										</div><!-- end card-->					
									</div>
									
									
							</div>
							<!-- end row -->

            </div>
			<!-- END container-fluid -->

		</div>
		<!-- END content -->

    </div>
    
<!-- BEGIN Java Script for this page -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js?ver=<%=System.currentTimeMillis()%>"></script>
<script src="/admin/js/admin-main.js"></script>

<script>
	$( document ).ready(function() {
	    $(function() {  
	    	$(".nicescroll").niceScroll({cursorcolor:"#858586"});
		});
	});
</script>
