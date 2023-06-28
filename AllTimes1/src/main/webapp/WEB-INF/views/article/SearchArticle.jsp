<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
      <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>All Times News</title>

      <!--Bootstrap core CSS-->
      <link href="resources/css/bootstrap.min.css" rel="stylesheet">

      <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

      <!-- Custom styles for this template -->

      <link href="resources/css/custom.css" rel="stylesheet">
      <link href="resources/css/responsive-style.css" rel="stylesheet">  
      <link href="resources/css/weather-icons.min.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="resources/css/font-awesome.min.css" />
      <link href="resources/css/lightbox.min.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="resources/css/loaders.css"/>
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
      <style></style>
      </head>

      <body>
          


	<!-- Header -->
	<%@ include file="../includes/Header.jsp" %>
	
	<!-- Navigation -->
	<%@ include file="../includes/Navigation.jsp" %>
	
	<!-- Content -->
	<section class="section-01">
        <div class="container">
    <div class="row">
            <div class="col-lg-12 ">
            <!-- 기사 제목으로 검색 -->
        <h3 class="heading-large"> 검색한내용 : </h3>
        <div class="row">
       	<c:forEach items="${SearchArt }" var="search">
                <div class="col-lg-12">
            <div class="card"> <a href="ArticleInfo?ar_no=${search.ar_no }"><img class="img-fluid" style="height:240px; width:340px;" src="resources/img/${search.ar_img}" alt=""><br></a>
                    <div class="card-block">
                <div class="news-title"><a href="ArticleInfo?ar_no=${search.ar_no }">
                  <h1 class=" title-small" style="font-weight:bold; font-size:35px;">${search.ar_title }</h1>
                  </a><br>
                </div>
                  <c:choose>
                  	<c:when test="${fn:length(search.ar_detail) gt 300}">
                  		<c:out value="${fn:substring(search.ar_detail, 0, 299)}"></c:out>...
                  	</c:when>
                  	<c:otherwise>
                  		<c:out value="${search.ar_detail}"></c:out>
                  	</c:otherwise>
                  </c:choose>
                <!--  <a href="#" style="color: black;"><p class="card-text">${search.ar_detail }</p></a> -->
                <hr>
              </div>
                  </div>
          </div>
          </c:forEach> 
              </div>
      </div>
            
          </div>
  </div>
      </section>
	
	
	
	<!-- Footer -->
	<%@ include file="../includes/Footer.jsp" %>
	




<!-- Bootstrap core JavaScript
    ================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<script src="resources/js/jquery.min.js"></script> 
<script src="resources/js/bootstrap.min.js"></script> 
<script src="resources/js/core.js"></script> 

<!--  Jquery 사용 스크립트 -->
<script src="resources/js/lightbox-plus-jquery.min.js"></script> 


</body>
</html>

