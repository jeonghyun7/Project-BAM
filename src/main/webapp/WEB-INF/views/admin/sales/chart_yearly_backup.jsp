<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"/>


<style>
	html, body{
		 width:100%;
	  	height:100%;
	}

	.grid-container {
	  position: fixed;
	  width:85%;
	  height:100%;
	  display: grid;
	  grid-template-columns: 1fr;
	  grid-template-rows: 1fr 1fr;
	  gap: 1px 1px;
	  grid-template-areas: "top-chart" "down-table";
	}

	.top-chart { grid-area: top-chart; height:50%;
	position: fixed }}
	
	.down-table { grid-area: down-table; }

</style>
<div class="content-page">
	
		<!-- Start content -->
        <div class="content">
            
			<div class="container-fluid">

					<div class="row">
							<div class="col-xl-12">
									<div class="breadcrumb-holder">
											<h1 class="main-title float-left">매출 통계</h1>
											<ol class="breadcrumb float-right">
												<li class="breadcrumb-item">Home</li>
												<li class="breadcrumb-item">매출통계</li>
												<li class="breadcrumb-item active">전체 월별 매출</li>
											</ol>
											<div class="clearfix"></div>
									</div>
							</div>
					</div>
					<!-- end row -->

					
					<div class="grid-container" style="height:auto !important">
						<div class="top-chart">
							<div class="card mb-3">
									<div class="card-header">
										<i class="fa fa-table"></i> Combo Bar Line Chart
									</div>
										
									<div class="card-body">
										<canvas id="comboBarLineChart"></canvas>
									</div>							
									<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
							</div>
							<!-- end card-->					
						</div>
  						<div class="down-table">
  							<table id="example" class="display" style="width:100%">
						        <thead>
						            <tr>
						                <th>Name</th>
						                <th>Position</th>
						                <th>Office</th>
						                <th>Extn.</th>
						                <th>Start date</th>
						                <th>Salary</th>
						            </tr>
						        </thead>
						        <tfoot>
						            <tr>
						                <th>Name</th>
						                <th>Position</th>
						                <th>Office</th>
						                <th>Extn.</th>
						                <th>Start date</th>
						                <th>Salary</th>
						            </tr>
						        </tfoot>
						    </table>
  						</div>
									
					</div>
					<!-- end grid-container -->

            </div>
			<!-- END container-fluid -->

		</div>
		<!-- END content -->

    </div>
	<!-- END content-page -->


<!-- BEGIN Java Script for this page -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js" defer></script>

	
	
	<script>
	// comboBarLineChart
	var ctx2 = document.getElementById("comboBarLineChart").getContext('2d');
	var comboBarLineChart = new Chart(ctx2, {
		type: 'bar',
		data: {
			labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
			datasets: [{
					type: 'line',
					label: 'Dataset 1',
					borderColor: '#484c4f',
					borderWidth: 3,
					fill: false,
					data: [12, 19, 3, 5, 2, 3, 13, 17, 11, 8, 11, 9],
				}, {
					type: 'bar',
					label: 'Dataset 2',
					backgroundColor: '#FF6B8A',
					data: [10, 11, 7, 5, 9, 13, 10, 16, 7, 8, 12, 5],
					borderColor: 'white',
					borderWidth: 0
				}, {
					type: 'bar',
					label: 'Dataset 3',
					backgroundColor: '#059BFF',
					data: [10, 11, 7, 5, 9, 13, 10, 16, 7, 8, 12, 5],
				}], 
				borderWidth: 1
		},
		options: {
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero:true
					}
				}]
			}
		}
	});	


	var dataSet = [
	    [ "Tiger Nixon", "System Architect", "Edinburgh", "5421", "2011/04/25", "$320,800" ],
	    [ "Garrett Winters", "Accountant", "Tokyo", "8422", "2011/07/25", "$170,750" ],
	    [ "Ashton Cox", "Junior Technical Author", "San Francisco", "1562", "2009/01/12", "$86,000" ],
	    [ "Cedric Kelly", "Senior Javascript Developer", "Edinburgh", "6224", "2012/03/29", "$433,060" ],
	    [ "Airi Satou", "Accountant", "Tokyo", "5407", "2008/11/28", "$162,700" ],
	    [ "Brielle Williamson", "Integration Specialist", "New York", "4804", "2012/12/02", "$372,000" ],
	    [ "Herrod Chandler", "Sales Assistant", "San Francisco", "9608", "2012/08/06", "$137,500" ],
	    [ "Rhona Davidson", "Integration Specialist", "Tokyo", "6200", "2010/10/14", "$327,900" ],
	    [ "Colleen Hurst", "Javascript Developer", "San Francisco", "2360", "2009/09/15", "$205,500" ],
	    [ "Sonya Frost", "Software Engineer", "Edinburgh", "1667", "2008/12/13", "$103,600" ],
	    [ "Jena Gaines", "Office Manager", "London", "3814", "2008/12/19", "$90,560" ],
	    [ "Quinn Flynn", "Support Lead", "Edinburgh", "9497", "2013/03/03", "$342,000" ],
	    [ "Charde Marshall", "Regional Director", "San Francisco", "6741", "2008/10/16", "$470,600" ],
	    [ "Haley Kennedy", "Senior Marketing Designer", "London", "3597", "2012/12/18", "$313,500" ],
	    [ "Tatyana Fitzpatrick", "Regional Director", "London", "1965", "2010/03/17", "$385,750" ],
	    [ "Michael Silva", "Marketing Designer", "London", "1581", "2012/11/27", "$198,500" ],
	    [ "Paul Byrd", "Chief Financial Officer (CFO)", "New York", "3059", "2010/06/09", "$725,000" ],
	    [ "Gloria Little", "Systems Administrator", "New York", "1721", "2009/04/10", "$237,500" ],
	    [ "Bradley Greer", "Software Engineer", "London", "2558", "2012/10/13", "$132,000" ],
	    [ "Dai Rios", "Personnel Lead", "Edinburgh", "2290", "2012/09/26", "$217,500" ],
	    [ "Jenette Caldwell", "Development Lead", "New York", "1937", "2011/09/03", "$345,000" ],
	    [ "Yuri Berry", "Chief Marketing Officer (CMO)", "New York", "6154", "2009/06/25", "$675,000" ],
	    [ "Caesar Vance", "Pre-Sales Support", "New York", "8330", "2011/12/12", "$106,450" ],
	    [ "Doris Wilder", "Sales Assistant", "Sydney", "3023", "2010/09/20", "$85,600" ],
	    [ "Angelica Ramos", "Chief Executive Officer (CEO)", "London", "5797", "2009/10/09", "$1,200,000" ],
	    [ "Gavin Joyce", "Developer", "Edinburgh", "8822", "2010/12/22", "$92,575" ],
	    [ "Jennifer Chang", "Regional Director", "Singapore", "9239", "2010/11/14", "$357,650" ],
	    [ "Brenden Wagner", "Software Engineer", "San Francisco", "1314", "2011/06/07", "$206,850" ],
	    [ "Fiona Green", "Chief Operating Officer (COO)", "San Francisco", "2947", "2010/03/11", "$850,000" ],
	    [ "Shou Itou", "Regional Marketing", "Tokyo", "8899", "2011/08/14", "$163,000" ],
	    [ "Michelle House", "Integration Specialist", "Sydney", "2769", "2011/06/02", "$95,400" ],
	    [ "Suki Burks", "Developer", "London", "6832", "2009/10/22", "$114,500" ],
	    [ "Prescott Bartlett", "Technical Author", "London", "3606", "2011/05/07", "$145,000" ],
	    [ "Gavin Cortez", "Team Leader", "San Francisco", "2860", "2008/10/26", "$235,500" ],
	    [ "Martena Mccray", "Post-Sales support", "Edinburgh", "8240", "2011/03/09", "$324,050" ],
	    [ "Unity Butler", "Marketing Designer", "San Francisco", "5384", "2009/12/09", "$85,675" ]
	];
	
	
	
	//테이블
	$(document).ready(function() {
	    $('#example').DataTable( {
	        data: dataSet,
	        columns: [
	            { title: "Name" },
	            { title: "Position" },
	            { title: "Office" },
	            { title: "Extn." },
	            { title: "Start date" },
	            { title: "Salary" }
	        ]
	    } );
	} );
	</script>
<!-- END Java Script for this page -->


</html>