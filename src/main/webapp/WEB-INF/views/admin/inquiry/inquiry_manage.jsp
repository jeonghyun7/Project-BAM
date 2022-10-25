<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
		<!-- BEGIN CSS for this page -->
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>	
		<style>	
			thead th{
				color: #ffffff;
				background-color: #4980B5;
			}
			#button_center{
				display: flex;
				justify-content: center;
			}
			.click-table-row{
				cursor:pointer;
			}
			#inquiry-detail{
				display: none;
			}
		</style>		
		<!-- END CSS for this page -->
		
    <div class="content-page">
	
		<!-- Start content -->
        <div class="content">
            
			<div class="container-fluid">
			
				<div class="row">
						<div class="col-xl-12">
								<div class="breadcrumb-holder">
										<h1 class="main-title float-left">Data Tables</h1>
										<ol class="breadcrumb float-right">
											<li class="breadcrumb-item">Home</li>
											<li class="breadcrumb-item active">Data Tables</li>
										</ol>
										<div class="clearfix"></div>
								</div>
						</div>
				</div><!-- end row -->
				
				<div id="msg-alert">
				</div>
				
				<div class="row">
				
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">						
							<div class="card mb-6">
								<div class="card-header">
									<h3><i class="fa fa-table"></i> 사업자 등록 관리</h3>
									 <div class="input-group">
									 <div class="input-group-prepend">
									    <label class="input-group-text" for="inputGroupSelect01">검색 분류</label>
									  </div>
									    <select class="custom-select" id="category-search">
										    <option value="email" selected>이메일</option>
										    <option value="title">제목</option>
										  </select>
									  <div class="input-group-prepend">
									    <label class="input-group-text" for="inputGroupSelect01">검색</label>
									  </div>
									  <input id="search" onkeyup="search_word(1);" type="text" class="form-control" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
									</div>
								</div>
									
								<div id="card-body-table" class="card-body">
									<!-- <<ajax 통신>> -->
								</div><!-- end card body -->										
							</div><!-- end card-->					
						</div><!-- end col -->
			
			
						<div id="inquiry-detail" class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">						
							<div class="card mb-3">
								<div class="card-header">
									<h3><i class="fa fa-table"></i> 회원 정보 수정</h3>
									정보를 수정 후 하단의 수정 버튼을 클릭해주세요.
								</div>
							</div> <!-- deprecated -->
						</div> <!-- deprecated -->
				</div><!-- end row -->
				

            </div><!-- END container-fluid -->

		</div><!-- END content -->

    </div><!-- END content-page -->

    <script src="/admin/js/inquiry_manage.js"></script>