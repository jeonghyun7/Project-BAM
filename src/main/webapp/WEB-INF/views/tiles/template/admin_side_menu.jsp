<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<!-- Left Sidebar -->
	<div class="left main-sidebar">
	
		<div class="sidebar-inner leftscroll">

			<div id="sidebar-menu">
        
			<ul>

					<li class="submenu">
						<a class="" href="main.bam"><i class="fa fa-fw fa fa-home"></i><span> 관리자 메인 </span> </a>
                    </li>
					<li class="submenu">
						<a class="" href="/"><i class="fa fa-fw fa fa-home"></i><span> 불밤야밤 홈 </span> </a>
                    </li>

					<li class="submenu1">
                        <a id="member-menu" href="#"><i class="fa fa-group bigfonts" aria-hidden="true"></i>
                        	<span> 회원 관리 </span>
                        	<span class="menu-arrow"></span>
                        </a>
                            <ul class="list-unstyled">
								<li class="active" id="member-submenu">
                                    <a href="member_manage.bam"><span>회원</span></a>
                                </li>
                                <li id="withdrawal-member-submenu">
                                    <a href="leave_member_manage.bam"><span>탈퇴 회원</span> </a>
                                </li>                                
                            </ul>
                    </li>

					<li class="submenu">
                        <a href="inquiry_manage.bam"><i class="fa fa-list-alt bigfonts" aria-hidden="true"></i><span> 사업자 등록 관리 </span> </a>
                    </li>
                    
					<li class="submenu">
                        <a href="#"><i class="fa fa-fw fa-area-chart"></i><span> 통계 </span> </a>
                        <ul class="list-unstyled">
								<li class="active" id="member-submenu">
                                    <a href="sales_camp_daily.bam"><span>캠핑장 일자별 매출</span></a>
                                </li>
								<li id="member-submenu">
                                    <a href="sales_camp_monthly.bam"><span>캠핑장 월별 매출</span></a>
                                </li>
                                <li id="withdrawal-member-submenu">
                                    <a href="sales_camp_yearly.bam"><span>캠핑장 연도별 매출</span> </a>
                                </li>                                
                                <li id="withdrawal-member-submenu">
                                    <a href="sales_bam_daily.bam"><span>사이트 일자별 매출</span> </a>
                                </li>                                
                                <li id="withdrawal-member-submenu">
                                    <a href="sales_bam_monthly.bam"><span>사이트 월별 매출</span> </a>
                                </li>                                
                                <li id="withdrawal-member-submenu">
                                    <a href="sales_bam_yearly.bam"><span>사이트 연도별 매출</span> </a>
                                </li>                                
                            </ul>
                    </li>

					<li class="submenu">
                       <a href="camp_manage.bam"><i class="fa fa-list"></i><span> 캠핑장 관리 </span> </a>
                    </li>
                    
            </ul>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
      </div>
	</div>
	<!-- End Sidebar -->