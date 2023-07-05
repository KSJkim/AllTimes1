<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<!DOCTYPE html>
<html>
      <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>AllTimes</title>

      <!--Bootstrap core CSS-->
      <link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">

      <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

      <!-- Custom styles for this template -->

      <link href="${pageContext.request.contextPath }/resources/css/custom.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath }/resources/css/responsive-style.css" rel="stylesheet">  
      <link href="${pageContext.request.contextPath }/resources/css/weather-icons.min.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" />
      <link href="${pageContext.request.contextPath }/resources/css/lightbox.min.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/loaders.css"/>

      <style type="text/css">
      	.small-top{background: orangered;}
      	.top-head{background: orangered;}
      	.check{color: white; }
      </style>

      </head>

 <body>
 <%@ include file="./includes/Admin_Header.jsp" %>
<section>
	<div class="container">
		<div>
			<div class="col-sm-4">
			
			<div style="border-bottom: solid red 1px;">
				<h3><i class="fa fa-users" aria-hidden="true"></i> <span>회원 수</span></h3></div>
				<div><h3>${homeInfo.countM }</h3></div>
			</div>
			<div class="col-sm-4">
				<div style="border-bottom: solid red 1px;">
				<h3><i class="fa fa-user-secret" aria-hidden="true"></i><span>기자 수</span></h3></div>
				<div><h3>${homeInfo.countR }</h3></div>
			</div>
		
		</div>

	</div>
</section>


	<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/core.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/lightbox-plus-jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.easing.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/jquery-easing/jquery.easing.min.js"></script>
</body>
</html>
