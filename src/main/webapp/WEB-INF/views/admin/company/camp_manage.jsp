<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

		<!-- BEGIN CSS for this page -->
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css"/>	
		<style>	
		td.details-control {
		background: url('/admin/plugins/datatables/img/details_open.png') no-repeat center center;
		cursor: pointer;
		}
		tr.shown td.details-control {
		background: url('/admin/plugins/datatables/img/details_close.png') no-repeat center center;
		}
		
		textarea.child {
			resize: none;
			border: none;
			background: transparent;
		}
		
		</style>		
		<!-- END CSS for this page -->
		
		

<body class="adminbody">
		
<div id="main">



    <div class="content-page">
	
		<!-- Start content -->
        <div class="content">
            
			<div class="container-fluid">

					
							
				<div class="row">
						<div class="col-xl-12">
								<div class="breadcrumb-holder">
										<h1 class="main-title float-left">캠핑장 관리</h1>
										<ol class="breadcrumb float-right">
											<li class="breadcrumb-item">Home</li>
											<li class="breadcrumb-item active">캠핑장 관리</li>
										</ol>
										<div class="clearfix"></div>
								</div>
						</div>
				</div>
				<!-- end row -->

				


				
				<div class="row" style="width: 100% !important; height: 100% !important;">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12" >						
							<div class="card mb-3">
								<div class="card-header">
									<h3><i class="fa fa-list"></i> 캠핑장 관리</h3>
									캠핑장 리스트 추가, 수정 및 삭제	
								</div>
									
								<div class="card-body">
									
									<div class="table-responsive">
									<table id="example2" class="table table-bordered table-hover display">
										<thead>
											<tr>
												<th></th>
												<th>캠핑장 일련번호</th>
												<th>캠핑장 이름</th>
												<th>캠핑장 종류</th>
												<th>지번 주소</th>
											</tr>
										</thead>
										<!-- <tfoot>
											<tr>
												<th></th>
												
											</tr>
										</tfoot> -->
									</table>
									</div>
									
								</div>							
							</div><!-- end card-->					
						</div>
						
						
				</div>


            </div>
			<!-- END container-fluid -->

		</div>
		<!-- END content -->

    </div>
	<!-- END content-page -->
    

</div>



<!-- BEGIN Java Script for this page -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js" defer></script>
	<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js" defer></script>

	<script>

	// START CODE FOR Child rows (show extra / detailed information) DATA TABLE 
	function format (d) {
		// `d` is the original data object for the row
		return '<div class="table-responsive" style="width:auto; height:auto; overflow-x:auto;padding:20px;">'+
			'<form action="campEdit.bam" method="post">'+
			'<table class="table table-hover" style="width:auto; display: block;">'+
			'<thead>'+
			'<tr>'+
				'<th>캠핑장명</th>'+
				'<th>주소</th>'+
				'<th>캠핑장 전화번호</th>'+
				'<th>캠핑장 사이트(site) 수</th>'+
				'<th>1일최대수용인원</th>'+
				'<th>주차장 면 수</th>'+
				'<th>편의시설</th>'+
				'<th>안전시설</th>'+
				'<th>기타 부대시설</th>'+
				'<th>관리기관명</th>'+
				'<th>관리기관 전화번호</th>'+
				'<th>캠핑장 설명</th>'+
				'<th>바베큐 가격</th>'+
			'</tr>'+
			'</thead>'+
			'<tbody style="text-align:center;" border="1">'+
			'<tr>'+
				'<input type="hidden" name="camp_idx" value="'+d.camp_idx+'">'+
				'<td><textarea class="child" name="camp_name" readonly>'+d.camp_name+'</textarea></td>'+
				'<td><textarea class="child" name="address" readonly>'+d.address+'</textarea></td>'+
				'<td><textarea class="child" name="camp_tel" readonly>'+d.camp_tel+'</textarea></td>'+
				'<td><textarea class="child" name="site_num" readonly>'+d.site_num+'</textarea></td>'+
				'<td><textarea class="child" name="full_num" readonly>'+d.full_num+'</textarea></td>'+
				'<td><textarea class="child" name="parking" readonly>'+d.parking+'</textarea></td>'+
				'<td><textarea class="child" name="conv" readonly>'+d.conv+'</textarea></td>'+
				'<td><textarea class="child" name="sec_conv" readonly>'+d.sec_conv+'</textarea></td>'+
				'<td><textarea class="child" name="etc_conv" readonly>'+d.etc_conv+'</textarea></td>'+
				'<td><textarea class="child" name="agency_name" readonly>'+d.agency_name+'</textarea></td>'+
				'<td><textarea class="child" name="agency_tel" readonly>'+d.agency_tel+'</textarea></td>'+
				'<td><textarea class="child" name="intro" readonly>'+d.intro+'</textarea></td>'+
				'<td><textarea class="child" name="intro" readonly>'+d.bbq_fee+'</textarea></td>'+
			'</tr>'+
			'</tbody>'+
			'<tfoot>'+
			'<tr>'+
				'<input type="button" class="btn btn-outline-danger" id="del_camp" value="삭제">'+
				'&nbsp;'+ '<input type="button" class="btn btn-outline-primary" value="수정" onclick="changeOnChild(this)">'+
				'<input type="submit" class="btn btn-outline-success" value="수정 완료" style="display:none;">'+
			'</tr>'+
			'</tfoot>'+
		'</table>'+
		'</form>'+
		'<div>'+
		'<div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">'+
				'<div class="modal-dialog" role="document">'+
					'<div class="modal-content">'+
						'<div class="modal-header">'+
							'<h5 class="modal-title" id="exampleModalLabel">test  </h5>'+
							'<button class="close" type="button" data-dismiss="modal" aria-label="Close">'+
								'<span aria-hidden="true">X</span>'+
							'</button>'+
						'</div>'+
						'<div class="modal-body">해당 캠핑장을 삭제하겠습니까?</div>'+
						'<div class="modal-footer">'+
							'<a class="btn" id="modalY" style="color:red !important;" href="campDel.bam?camp_idx='+d.camp_idx+'">예</a>'+
							'<button class="btn" type="button" data-dismiss="modal">아니요</button>'+
						'</div>'+
					'</div>'+
				'</div>'+
			'</div>'+
			'<script>'+
			'$("#del_camp").click(function(e){'+
				'e.preventDefault();'+
				'$("#testModal").modal("show");'+
			'})'+ 
			'<\/script>';
	}

		
		$(document).ready(function() {
			var table = $('#example2').DataTable( {
				pageLength : 10,
				bPaginate : true,
				processing : true,
				ajax : {
					"url": "campData.bam",
					"type": "POST",
					"contentType": "application/json; charset=utf-8"
				},
				columns: [
					{
						"className":      'details-control',
						"orderable":      true,
						"data":           null,
						"defaultContent": ''
					},
					{ data: "camp_idx" },
					{ data: "camp_name" , defaultContent : "<i>없음</i>"},
					{ data: "conv" , defaultContent : "<i>없음</i>"},
					{ data: "address" , defaultContent : "<i>없음</i>"}
					
				]/* ,
				"order": [[1, 'asc']] */
			} );
			 
			// Add event listener for opening and closing details
			$('#example2 tbody').on('click', 'td.details-control', function () {
				var tr = $(this).closest('tr');
				var row = table.row(tr);
		 
				if ( row.child.isShown() ) {
					// This row is already open - close it
					row.child.hide();
					tr.removeClass('shown');
				}else {
					// Open this row
					row.child( format(row.data())).show();
					tr.addClass('shown');
				}
			} );
		} );
		// END CODE FOR Child rows (show extra / detailed information) DATA TABLE 		
		
		function changeOnChild(e){	
			e.nextElementSibling.style.display = "inline";
       	 	e.style.display = "none";
       	 	const list = document.querySelectorAll('.child');
       	 	for (let i of list){
	       	 	i.readOnly = false;
	       	 	//alert("i: " +i);
	       	 	i.style.border = 'solid 1px #d0cfcf';
	       	 	i.style.background = '#efefef';
       	 	}
		}
			
	</script>	
<!-- END Java Script for this page -->

</body>
