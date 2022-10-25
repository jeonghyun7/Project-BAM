<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><tiles:getAsString name="title" /></title>
	<meta name="description" content="Free Bootstrap 4 Admin Theme | Pike Admin">
	<meta name="author" content="Pike Web Development - https://www.pikephp.com">

	<!-- Favicon -->
	<link rel="shortcut icon" href="/admin/images/asdad.png">
	<!-- <link rel="icon" href="/images/asdad.png" type="image/x-icon"> -->
	<script src="/admin/js/jquery.min.js?ver=<%=System.currentTimeMillis()%>"></script>

	<!-- Bootstrap CSS -->
	<link href="/admin/css/bootstrap.min.css?ver=<%=System.currentTimeMillis()%>" rel="stylesheet" type="text/css" />
	
	<!-- Font Awesome CSS -->
	<link href="/admin/font-awesome/css/font-awesome.min.css?ver=<%=System.currentTimeMillis()%>" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />	
	<!-- Custom CSS -->
	<link href="/admin/css/style.css?ver=<%=System.currentTimeMillis()%>" rel="stylesheet" type="text/css" />
	
</head>
  
<!-- <body class="adminbody"> -->
<body class="adminbody" onbeforeunload="handleBrowserCloseButton(event);">
    <div id="main">
    <header id="header">
        <tiles:insertAttribute name="header" />
    </header>
     
     <section id="sidemenu"> 
     	<tiles:insertAttribute name="menu" />
     </section>
     
	<section id="siteContent">
		<tiles:insertAttribute name="body" />
	</section>


    <footer id="footer">
        <tiles:insertAttribute name="footer" />
    </footer>
    </div>
    <!-- END main -->
    
<script src="/admin/js/modernizr.min.js"></script>

<script src="/admin/js/moment.min.js"></script>
<script src="/admin/js/popper.min.js"></script>
<script src="/admin/js/bootstrap.min.js"></script>

<script src="/admin/js/detect.js"></script>
<script src="/admin/js/fastclick.js"></script>
<script src="/admin/js/jquery.blockUI.js"></script>
<script src="/admin/js/jquery.nicescroll.js"></script>

<!-- App js -->
<script src="/admin/js/pikeadmin.js"></script>

	<!-- Counter-Up-->
	<script src="/admin/plugins/waypoints/lib/jquery.waypoints.min.js?ver=<%=System.currentTimeMillis()%>"></script>
	<script src="/admin/plugins/counterup/jquery.counterup.min.js?ver=<%=System.currentTimeMillis()%>"></script>		
<!-- END Java Script for this page -->	
<script src="/js/browser-close.js?ver=<%=System.currentTimeMillis()%>"></script>
</body>
</html>