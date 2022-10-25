<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><tiles:getAsString name="title" /></title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="author" content="TechyDevs(remade by LDI, OSJ, LJH, YHS)">
    <meta name="description" content="불밤야밤 -- We provides camping reservation and We also offer camping information and community">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge, chrome=1">

    <!-- Favicon -->
    <link rel="icon" href="/images/asdad.png" type="image/x-icon">
    <!-- <link rel="icon" href="/images/asdad.png" type="image/png"> -->

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:100,200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Mukta:200,300,400,500,600,700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
    <!-- Template CSS Files -->
    <link rel="stylesheet" href="/css/bootstrap.min.css?ver=<%=System.currentTimeMillis()%>">
    <link rel="stylesheet" href="/css/font-awesome.css?ver=<%=System.currentTimeMillis()%>">
    <link rel="stylesheet" href="/css/line-awesome.css?ver=<%=System.currentTimeMillis()%>">
	<link rel="stylesheet" href="/css/owl.carousel.min.css?ver=<%=System.currentTimeMillis()%>">
    <link rel="stylesheet" href="/css/owl.theme.default.min.css?ver=<%=System.currentTimeMillis()%>">
    <link rel="stylesheet" href="/css/magnific-popup.css?ver=<%=System.currentTimeMillis()%>">
    <link rel="stylesheet" href="/css/animated-headline.css?ver=<%=System.currentTimeMillis()%>">
    <link rel="stylesheet" href="/css/daterangepicker.css?ver=<%=System.currentTimeMillis()%>">
    <link rel="stylesheet" href="/css/jquery-ui.css?ver=<%=System.currentTimeMillis()%>">
    <link rel="stylesheet" href="/css/jquery.filer.css?ver=<%=System.currentTimeMillis()%>">
    <link rel="stylesheet" href="/css/jquery.filer-dragdropbox-theme.css?ver=<%=System.currentTimeMillis()%>">
    <link rel="stylesheet" href="/css/select2.min.css?ver=<%=System.currentTimeMillis()%>">
    <link rel="stylesheet" href="/css/style.css?ver=<%=System.currentTimeMillis()%>">
    <script src="/js/modernizr.js?ver=<%=System.currentTimeMillis()%>"></script> <!-- Modernizr -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js?ver=<%=System.currentTimeMillis()%>"></script><!--jquery-->
</head>
  
<body onbeforeunload="handleBrowserCloseButton(event);">
    <header id="header">
        <tiles:insertAttribute name="header" />
    </header>
     
    <section id="body">
        <tiles:insertAttribute name="body" />
    </section>

    <footer id="footer">
        <tiles:insertAttribute name="footer" />
    </footer>
</body>
</html>
